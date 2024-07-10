import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme(),
      home: const HomePage(),
    );
  }
}
