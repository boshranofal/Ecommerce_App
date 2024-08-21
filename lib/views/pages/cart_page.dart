//import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
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
    final cartCubit = BlocProvider.of<ProductDatailsCubit>(context);
    return BlocBuilder<ProductDatailsCubit, ProductDatailsState>(
      bloc: cartCubit,
      builder: (context, state) {
        if (state is Adding) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is Added) {
          return Scaffold(
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
                    itemCount: state.product.length,
                    itemBuilder: (context, index) {
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
                                child: Image.asset(
                                  state.product[index].image,
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
                                      state.product[index].name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$${state.product[index].price}',
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
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            dummyProducts[index].quantity++;
                                          });
                                        },
                                      ),
                                      Text(
                                        '${dummyProducts[index].quantity}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          setState(
                                            () {
                                              if (dummyProducts[index]
                                                      .quantity >
                                                  0) {
                                                dummyProducts[index].quantity--;
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 210, 208, 208),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      cartCubit.remove(state.product[index]);
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 24,
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Subtotal', style: TextStyle(fontSize: 16.0)),
                            Text('\$93.00', style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Shipping', style: TextStyle(fontSize: 16.0)),
                            Text('\$6.00', style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color.fromARGB(255, 153, 143, 143),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total amount',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$99.00',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
