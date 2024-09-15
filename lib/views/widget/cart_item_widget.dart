// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/views/widget/counter_widget.dart';
import 'package:ecommerce_app/views_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItemWidget;
  const CartItemWidget({
    Key? key,
    required this.cartItemWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Card(
      child: Container(
        height: 130,
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                cartItemWidget.productCart.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cartItemWidget.productCart.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${cartItemWidget.productCart.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      (current is QuantityChanged &&
                          current.cartItemId == cartItemWidget.id) ||
                      (current is QuantityChanging &&
                          current.cartItemId == cartItemWidget.id),
                  builder: (context, state) {
                    if (state is QuantityChanging) {
                      return CounterWidget(
                        cubit: cartCubit,
                        isLoading: true,
                        cartItemId: cartItemWidget.id,
                      );
                    } else if (state is QuantityChanged) {
                      return CounterWidget(
                        cubit: cartCubit,
                        counter: state.counter,
                        cartItemId: cartItemWidget.id,
                      );
                    }
                    return CounterWidget(
                      cubit: cartCubit,
                      counter: cartItemWidget.quantity,
                      cartItemId: cartItemWidget.id,
                    );
                  },
                ),
                BlocBuilder<CartCubit, CartState>(
                  bloc: cartCubit,
                  buildWhen: (previous, current) =>
                      current is Removing || current is Removed,
                  builder: (context, state) {
                    if (state is Removing) {
                      return IconButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 210, 208, 208),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          null;
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      );
                    } else if (state is Removed) {
                      return IconButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 210, 208, 208),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          cartCubit.remove(cartItemWidget);
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return IconButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 210, 208, 208),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
