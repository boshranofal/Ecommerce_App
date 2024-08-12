import 'package:ecommerce_app/utils/app_colors.dart';

import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final detailscubit = BlocProvider.of<ProductDatailsCubit>(context);
    return BlocBuilder<ProductDatailsCubit, ProductDatailsState>(
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
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 235, 224, 224),
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
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: AppColors.grey2,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            detailscubit.counter.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          const SizedBox(width: 8),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
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
                                Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0XFF800000),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0XFFEAC117),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0XFFAB784E),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Color(0XFFE67451),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
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
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.shopping_bag,
                                              color: Colors.white),
                                          SizedBox(width: 4),
                                          Text('Add to cart',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    )
                  ])),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
