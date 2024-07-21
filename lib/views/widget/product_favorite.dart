// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/product_models.dart';

class ProductFavorite extends StatefulWidget {
  final ProductModels product;
  const ProductFavorite({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductFavorite> createState() => _ProductFavoriteState();
}

class _ProductFavoriteState extends State<ProductFavorite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            color: AppColors.grey,
            height: 108,
            width: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 235, 224, 224),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.network(
                widget.product.image,
                height: 97,
                //width: ,
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 8.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 217, 217),
                    shape: BoxShape.circle),
                child: InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.favorite,
                      size: 16,
                      color: Color.fromARGB(255, 228, 98, 89),
                    ),
                  ),
                  onTap: () {
                    if (dummyFavorite.contains(widget.product)) {
                      dummyFavorite.remove(widget.product);
                    } else {
                      dummyFavorite.add(widget.product);
                    }
                    setState(() {});
                  },
                ),
              )),
        ]),
        Text(
          widget.product.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          widget.product.category.name,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.grey,
              ),
        ),
        Text(
          '\$${widget.product.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}