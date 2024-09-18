import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widget/check_out_title_widget.dart';
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
    final checkCubit = BlocProvider.of<CheckOutCubit>(context);
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      buildWhen: (previous, current) =>
          current is CheckOutLoading ||
          current is CheckOutLoaded ||
          current is CheckOutError,
      bloc: checkCubit,
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
          // final cart = state.cart;
          // final preferredLocation = state.preferredLocation;
          // final preferredPaymentMethod = state.preferredPaymentMethod;
          // final totalPrice = state.total;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Check Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Column(
              children: [
                CheckOutTitleWidget(title: 'Address', onTap: () {}),
              ],
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
