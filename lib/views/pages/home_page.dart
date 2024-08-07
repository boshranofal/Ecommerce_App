import 'package:ecommerce_app/views/pages/catugory_tab_inner.dart';
import 'package:ecommerce_app/views/pages/home_tab_inner.dart';
import 'package:ecommerce_app/views_models/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            dividerHeight: 0,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Catugory'),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              children: [
                BlocProvider(
                  create: (context) {
                    final cubit = HomeTapCubit();
                    cubit.getHomeDate();
                    return cubit;
                  },
                  child: HomeTabInner(),
                ),
                const CatugoryTabInner(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
