// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModels product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            height: 113,
            width: 200,
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
                    //color: Color.fromARGB(255, 235, 217, 217),
                    shape: BoxShape.circle),
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      dummyFavorite.contains(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (dummyFavorite.contains(widget.product)) {
                        dummyFavorite.remove(widget.product);
                      } else {
                        dummyFavorite.add(widget.product);
                      }
                    });
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
