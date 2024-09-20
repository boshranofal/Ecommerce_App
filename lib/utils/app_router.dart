import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views/pages/address_page.dart';
import 'package:ecommerce_app/views/pages/check_out_page.dart';
import 'package:ecommerce_app/views/pages/pay_ment_details.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:ecommerce_app/views/pages/sign_in.dart';
import 'package:ecommerce_app/views/pages/sign_up.dart';
import 'package:ecommerce_app/views/widget/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views_models/cubit/check_out_cubit.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productdetails:
        final productId = settings.arguments as ProductModels;

        //print('Type of productId: ${productId.runtimeType}');
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDatailsCubit();
              cubit.getProductDetails(productId.id);
              return cubit;
            },
            child: const ProductDetails(),
          ),
        );
      case AppRoutes.signup:
        return CupertinoPageRoute(builder: (_) => const SignUp());
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => const CustomBottomNavbar());
      case AppRoutes.checkout:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) {
                    final cubit = CheckOutCubit();
                    cubit.getCheckoutData();
                    return cubit;
                  },
                  child: const CheckOutPage(),
                ));
      case AppRoutes.address:
        return CupertinoPageRoute(builder: (_) => const AddressPage());

      case AppRoutes.paymentdetails:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) {
                    final cubit = CheckOutCubit();
                    cubit.getpaymentMethods();
                    return cubit;
                  },
                  child: const PayMentDetails(),
                ));
      case AppRoutes.signin:
      default:
        return CupertinoPageRoute(builder: (_) => const SignIn());
    }
  }
}
