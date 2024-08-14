import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/catugory_tab_inner.dart';
import 'package:ecommerce_app/views/pages/home_tab_inner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //int currentIndex = 0;
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
        body: const DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                dividerHeight: 0,
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Catugory'),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HomeTabInner(),
                    CatugoryTabInner(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buildtitle() {
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
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
