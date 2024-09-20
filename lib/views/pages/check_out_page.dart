import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views/widget/check_out_cart_item_widget.dart';
import 'package:ecommerce_app/views/widget/check_out_title_widget.dart';
import 'package:ecommerce_app/views/widget/location_item_widget.dart';
import 'package:ecommerce_app/views/widget/main_button.dart';
import 'package:ecommerce_app/views/widget/payment_method_widget.dart';
import 'package:ecommerce_app/views_models/cubit/check_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckOutCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: BlocBuilder<CheckOutCubit, CheckOutState>(
        bloc: checkoutCubit,
        buildWhen: (previous, current) =>
            current is CheckOutLoaded ||
            current is CheckOutError ||
            current is CheckOutLoading,
        builder: (context, state) {
          if (state is CheckOutLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CheckOutError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is CheckOutLoaded) {
            final totalAmount = state.total;
            final shippingAddress = state.preferredLocation;
            final cartOrders = state.cart;
            final paymentMethod = state.preferredPaymentMethod;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    CheckOutTitleWidget(
                      title: 'Address',
                      onTap: shippingAddress == null
                          ? null
                          : () => Navigator.of(context, rootNavigator: true)
                                  .pushNamed(
                                AppRoutes.address,
                              ),
                    ),
                    if (shippingAddress != null)
                      LocationItemWidget(location: shippingAddress),
                    const SizedBox(height: 24),
                    CheckOutTitleWidget(
                      title: 'Products',
                      numOfItems: cartOrders.length,
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartOrders.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cartOrder = cartOrders[index];
                        return CheckOutCartItemWidget(cartItem: cartOrder);
                      },
                    ),
                    CheckOutTitleWidget(
                      title: 'Payment Method',
                      onTap: paymentMethod == null
                          ? null
                          : () => Navigator.of(context, rootNavigator: true)
                              .pushNamed(AppRoutes.productdetails),
                    ),
                    const SizedBox(height: 16),
                    if (paymentMethod != null)
                      PaymentMethodItemWidget(
                        paymentMethod: paymentMethod,
                      ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.grey,
                                  ),
                        ),
                        Text(
                          '\$$totalAmount',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    MainButton(
                      label: 'Pay',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
