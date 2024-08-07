import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widget/home_carousel_slider.dart';
import 'package:ecommerce_app/views/widget/product_item.dart';
import 'package:ecommerce_app/views_models/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabInner extends StatelessWidget {
  const HomeTabInner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeTabCubit = BlocProvider.of<HomeTapCubit>(context);
    return BlocBuilder<HomeTapCubit, HomeTapState>(
      bloc: homeTabCubit,
      buildWhen: (previous, current) =>
          current is HomeLoaded ||
          current is HomeLoading ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeLoaded) {
          final products = state.products;
          final imgurls = state.imgurls;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    child: HomeCarouselSlider(
                      imgurls: imgurls,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Arrivals🔥',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Card(
                    child: GridView.builder(
                      itemCount: products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: ProductItem(
                            product: products[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          if (state is HomeError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }
}
