import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views_models/product_datails_cubit/product_datails_cubit.dart';
import 'package:flutter/material.dart';

class CounterDetailsWidget extends StatelessWidget {
  final ProductDatailsCubit cubit;
  final int? counter;
  final bool isLoading;
  const CounterDetailsWidget({
    super.key,
    required this.cubit,
    this.counter,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: isLoading
          ? const CircularProgressIndicator.adaptive()
          : Row(
              children: [
                IconButton(
                  onPressed: () async => cubit.decrementCounter(),
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 8),
                Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () async => cubit.incrementCounter(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
    );
  }
}
