// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ecommerce_app/models/cart_models.dart';

class CheckOutCartItemWidget extends StatelessWidget {
  final CartModel cartItem;
  const CheckOutCartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.productCart.name),
      leading: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: cartItem.productCart.image,
            width: 60.0,
          ),
        ),
      ),
      subtitle: Text.rich(
        TextSpan(
          text: 'Quantity: ',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.grey,
              ),
          children: [
            TextSpan(
              text: cartItem.quantity.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
      trailing: Text(
        '\$${cartItem.quantity * cartItem.productCart.price}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
  //   return Row(
  //     children: [
  //       CachedNetworkImage(
  //         imageUrl: cartItem.productCart.image,
  //         height: 70,
  //         width: 60,
  //         fit: BoxFit.fill,
  //       ),
  //       const SizedBox(width: 8),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             cartItem.productCart.name,
  //             style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //           ),
  // Text.rich(
  //   TextSpan(
  //     text: 'Quantity: ',
  //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
  //           color: AppColors.grey,
  //         ),
  //     children: [
  //       TextSpan(
  //         text: cartItem.quantity.toString(),
  //         style: Theme.of(context).textTheme.labelLarge,
  //       ),
  //     ],
  //   ),
  // ),
  //         ],
  //       ),
  //       const Spacer(),
  //       Text(
  //         '\$${cartItem.productCart.price * cartItem.quantity}',
  //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //               color: AppColors.primary,
  //             ),
  //       ),
  //     ],
  //   );
  // }
}
