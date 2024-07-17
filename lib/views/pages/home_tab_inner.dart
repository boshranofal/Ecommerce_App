import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widget/home_carousel_slider.dart';
import 'package:ecommerce_app/views/widget/product_item.dart';
import 'package:flutter/material.dart';

class HomeTabInner extends StatelessWidget {
  const HomeTabInner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: const HomeCarouselSlider(),
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
                        color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            Card(
              child: GridView.builder(
                itemCount: dummyProducts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ProductItem(
                      product: dummyProducts[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
