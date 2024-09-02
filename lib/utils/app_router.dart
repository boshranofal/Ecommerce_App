import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:ecommerce_app/views/pages/sign_in.dart';
import 'package:ecommerce_app/views/widget/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views_models/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productdetails:
        final productId = settings.arguments as ProductModels;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDatailsCubit();
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: const ProductDetails(),
          ),
        );
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => const CustomBottomNavbar());
      case AppRoutes.signin:
      default:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: SignIn(),
                ));
    }
  }
}
