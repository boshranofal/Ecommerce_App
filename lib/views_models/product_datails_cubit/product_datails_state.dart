part of 'product_datails_cubit.dart';

sealed class ProductDatailsState {}

final class ProductDatailsInitial extends ProductDatailsState {}

final class ProductDatailsLoading extends ProductDatailsState {}

final class ProductDatailsLoaded extends ProductDatailsState {
  final ProductModels product;

  ProductDatailsLoaded({required this.product});
}

final class ProductDatailsError extends ProductDatailsState {
  final String message;

  ProductDatailsError({required this.message});
}

final class QuantityState extends ProductDatailsState {
  final int quantity;

  QuantityState({required this.quantity});
}

final class ProductDatailsAddToCart extends ProductDatailsState {
  final ProductModels product;

  ProductDatailsAddToCart({required this.product});
}

final class Adding extends ProductDatailsState {}

final class Added extends ProductDatailsState {
  final List<ProductModels> product;

  Added({required this.product});
}

final class AddError extends ProductDatailsState {
  final String message;

  AddError({required this.message});
}

final class SetCartAdding extends ProductDatailsState {
  final String id;

  SetCartAdding({required this.id});
}

final class SetCartAdded extends ProductDatailsState {
  final String id;
  final bool isCart;

  SetCartAdded({required this.id, required this.isCart});
}
