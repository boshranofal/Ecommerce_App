import 'package:ecommerce_app/views/widget/home_carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTabInner extends StatelessWidget {
  const HomeTabInner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.3,
          child: HomeCarouselSlider(),
        )
      ],
    );
  }
}
