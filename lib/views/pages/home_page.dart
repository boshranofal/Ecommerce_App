import 'package:ecommerce_app/views/pages/catugory_tab_inner.dart';
import 'package:ecommerce_app/views/pages/home_tab_inner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
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
                child: TabBarView(children: [
              HomeTabInner(),
              CatugoryTabInner(),
            ]))
          ],
        ));
  }
}
