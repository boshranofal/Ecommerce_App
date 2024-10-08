import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  final PaymentMethodModel? paymentMethod;
  const PaymentMethodItemWidget({
    super.key,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: paymentMethod == null
                    ? Column(
                        children: [
                          const Text('No payment available!'),
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AppRoutes.paymentdetails),
                            child: const Text('Add New payment'),
                          ),
                        ],
                      )
                    : const SizedBox(
                        height: 12,
                      ))));
    // return DecoratedBox(
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: AppColors.grey,
    //     ),
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(24.0),
    //     child: Row(
    //       children: [
    //         CachedNetworkImage(
    //           imageUrl: paymentMethod.imgUrl,
    //           height: 50,
    //           width: 50,
    //           fit: BoxFit.fill,
    //         ),
    //         const SizedBox(width: 8),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               paymentMethod.name,
    //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //             ),
    //             Text(
    //               paymentMethod.cardNumber,
    //               style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                     color: AppColors.grey,
    //                   ),
    //             ),
    //           ],
    //         ),
    //         const Spacer(),
    //         const Icon(
    //           Icons.chevron_right,
    //           color: AppColors.grey,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
