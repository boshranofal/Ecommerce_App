import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorite_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:ecommerce_app/views_models/home_tap_cubit/home_tap_cubit.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      stateManagement: false,
      onTabChanged: (value) => setState(() {
        _currentIndex = value;
      }),
      tabs: [
        PersistentTabConfig(
          screen: BlocProvider(
            create: (context) {
              final cubit = HomeTapCubit();
              cubit.getHomeDate();
              cubit.getcategory();
              return cubit;
            },
            child: const HomePage(),
          ),
          item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              activeForegroundColor: AppColors.primary,
              inactiveBackgroundColor: AppColors.grey5),
        ),
        PersistentTabConfig(
          screen: BlocProvider(
            create: (context) {
              final cubit = ProductDatailsCubit();
              cubit.addcart();
              return cubit;
            },
            child: const CartPage(),
          ),
          item: ItemConfig(
              icon: const Icon(Icons.shopping_cart),
              title: "Cart",
              activeForegroundColor: AppColors.primary,
              inactiveBackgroundColor: AppColors.grey5),
        ),
        PersistentTabConfig(
          screen: const FavoritePage(),
          item: ItemConfig(
              icon: const Icon(Icons.favorite),
              title: "Favorite",
              activeForegroundColor: AppColors.primary,
              inactiveBackgroundColor: AppColors.grey5),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
              icon: const Icon(Icons.person),
              title: "Profile",
              activeForegroundColor: AppColors.primary,
              inactiveBackgroundColor: AppColors.grey5),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
