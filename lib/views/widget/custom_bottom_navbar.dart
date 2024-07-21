import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorite_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/profile_image.jpg', bundle: null),
          ),
        ),
        title: buildtitle(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: PersistentTabView(
        stateManagement: false,
        onTabChanged: (value) => setState(() {
          _currentIndex = value;
        }),
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
                icon: const Icon(Icons.home),
                title: "Home",
                activeForegroundColor: AppColors.primary,
                inactiveBackgroundColor: AppColors.grey5),
          ),
          PersistentTabConfig(
            screen: const CartPage(),
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
      ),
    );
  }

  Widget buildtitle() {
    switch (_currentIndex) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Boshra',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Let\'s go shopping",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.grey, fontWeight: FontWeight.normal),
            )
          ],
        );
      case 1:
        return const Text("Cart");
      case 2:
        return const Text(
          "My Favorite",
        );
      case 3:
        return const Text("My Profile");
      default:
        return const Text("Home");
    }
  }
}
