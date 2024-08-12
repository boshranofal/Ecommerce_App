// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/utils/app_colors.dart';
// import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.counter,
    required this.cubit,
  }) : super(key: key);
  final int counter;
  final dynamic cubit;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => cubit.decrementCounter,
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => cubit.incrementCounter,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
