import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views_models/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeTabCubit = BlocProvider.of<HomeTapCubit>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 113,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 235, 224, 224),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                widget.product.image,
                height: 97,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BlocBuilder<HomeTapCubit, HomeTapState>(
                      bloc: homeTabCubit,
                      buildWhen: (previous, current) =>
                          (current is SetFavoritLoading &&
                              current.favoritid == widget.product.id) ||
                          (current is SetFavoritSuccess &&
                              current.favoritid == widget.product.id) ||
                          current is SetFavoritError,
                      builder: (context, state) {
                        if (state is SetFavoritLoading) {
                          return const CircularProgressIndicator.adaptive();
                        } else if (state is SetFavoritSuccess) {
                          return Icon(
                            state.isFavorit
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 16,
                            color: AppColors.primary,
                          );
                        }
                        return const Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: AppColors.primary,
                        );
                      },
                    ),
                  ),
                  onTap: () {
                    homeTabCubit.toggleFavorie(widget.product);
                  },
                ),
              ),
            ),
          ],
        ),
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
