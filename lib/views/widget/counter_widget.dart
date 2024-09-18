import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final CartCubit cubit;
  final int? counter;
  final bool isLoading;
  final String cartItemId;

  CounterWidget({
    super.key,
    required this.cubit,
    this.counter,
    required this.cartItemId,
    this.isLoading = false,
  }) : assert(counter != null || isLoading == true);
  final authServices = AuthServices();
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
            onPressed: isLoading
                ? null
                : () async {
                    final userId = authServices.currentUser?.uid;
                    if (userId != null) {
                      await cubit.decrementCounter(
                          counter!, cartItemId, userId);
                    }
                  },
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          if (!isLoading)
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (isLoading) const CircularProgressIndicator.adaptive(),
          const SizedBox(width: 8),
          IconButton(
            onPressed: isLoading
                ? null
                : () async {
                    final userId = authServices.currentUser?.uid;
                    if (userId != null) {
                      await cubit.incrementCounter(
                          counter!, cartItemId, userId);
                    }
                  },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
