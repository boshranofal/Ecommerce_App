import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widget/color_widget.dart';
import 'package:ecommerce_app/views/widget/counter_details_widget.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final detailscubit = BlocProvider.of<ProductDatailsCubit>(context);
    return BlocBuilder<ProductDatailsCubit, ProductDatailsState>(
        buildWhen: (previous, current) =>
            current is ProductDatailsLoaded ||
            current is ProductDatailsError ||
            current is ProductDatailsLoading,
        bloc: detailscubit,
        builder: (context, state) {
          if (state is ProductDatailsLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductDatailsError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ProductDatailsLoaded) {
            final product = state.product;
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 227, 212, 212),
              appBar: AppBar(
                actions: const [Icon(Icons.shopping_bag_outlined)],
                centerTitle: true,
                title: const Text(
                  'Details Product',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              body: SafeArea(
                //top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        state.product.image,
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    BlocBuilder<ProductDatailsCubit,
                                        ProductDatailsState>(
                                      bloc: detailscubit,
                                      buildWhen: (previous, current) =>
                                          current is QuantityChanged,
                                      builder: (context, state) {
                                        if (state is QuantityChanged) {
                                          final counter = state.quantity;
                                          return CounterDetailsWidget(
                                            cubit: detailscubit,
                                            counter: counter,
                                          );
                                        } else {
                                          return CounterDetailsWidget(
                                            cubit: detailscubit,
                                            counter: 1,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    Text(
                                      '4.5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text('Color',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: colors.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            detailscubit.selectColor(
                                                state.product, index);
                                          },
                                          child: ColorWidget(
                                            color: colors[index],
                                            isSelect:
                                                state.product.selectecolor ==
                                                    index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text('Description',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                  state.product.details,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${state.product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: BlocConsumer<ProductDatailsCubit,
                                          ProductDatailsState>(
                                        bloc: detailscubit,
                                        listenWhen: (previous, current) =>
                                            current is SetCartError,
                                        listener: (context, state) {
                                          if (state is SetCartAdded) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text('Alert !'),
                                                  content: const Text(
                                                      'You must select a size !'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        buildWhen: (previous, current) =>
                                            current is SetCartAdding ||
                                            current is SetCartAdded ||
                                            current is SetCartError,
                                        builder: (context, state) {
                                          if (state is SetCartAdding) {
                                            return ElevatedButton(
                                              onPressed: null,
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  foregroundColor:
                                                      AppColors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16))),
                                              child: const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(),
                                              ),
                                            );
                                          } else if (state is SetCartAdded) {
                                            return ElevatedButton(
                                              onPressed: null,
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  foregroundColor:
                                                      AppColors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16))),
                                              child: const Text('Added !'),
                                            );
                                          } else {
                                            return ElevatedButton(
                                              onPressed: () {
                                                detailscubit
                                                    .togglecart(product);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  foregroundColor:
                                                      AppColors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16))),
                                              child: const Text('Add to cart'),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: () {
                                    //     detailscubit.togglecart(state.product);
                                    //   },
                                    //   style: ElevatedButton.styleFrom(
                                    //     backgroundColor: const Color.fromRGBO(81, 78, 182, 1),
                                    //     shape: RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(16),
                                    //     ),
                                    //   ),
                                    //   child: Row(
                                    //     children: [
                                    //       const Icon(
                                    //         Icons.shopping_bag,
                                    //         color: Colors.white,
                                    //       ),
                                    //       Text(
                                    //         'Add to Cart',
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .titleMedium!
                                    //             .copyWith(
                                    //               color: Colors.white,
                                    //             ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}

List<Color> colors = const [
  Color(0XFF808000),
  Color(0XFFAB784E),
  Color(0XFF9E4638),
  Color(0XFFE55451),
];
