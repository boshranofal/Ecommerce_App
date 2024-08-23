//import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widget/cart_item_widget.dart';
import 'package:ecommerce_app/views/widget/lable_with_value_row.dart';
import 'package:ecommerce_app/views_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is CartLoading ||
          current is CartLoaded ||
          current is CartError,
      bloc: cartCubit,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          final cartItems = state.cart;
          final subtotal = state.subtotal;
          final shipping = state.shipping;
          final totalPrice = state.total;
          return RefreshIndicator(
            onRefresh: () async {
              cartCubit.getItems();
            },
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ],
                title: const Text('My Cart'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(cartItemWidget: cartItems[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20.0),
                          LableWithValueRow(
                            lable: 'Subtotal',
                            value: '\$${subtotal.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 10.0),
                          LableWithValueRow(
                            lable: 'Shipping',
                            value: '\$${shipping.toString()}',
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: Color.fromARGB(255, 153, 143, 143),
                          ),
                          LableWithValueRow(
                            lable: 'Total amount',
                            value: '\$${totalPrice.toString()}',
                          ),
                          const SizedBox(height: 20.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 50.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: AppColors.primary,
                              ),
                              child: const Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 18.0, color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
