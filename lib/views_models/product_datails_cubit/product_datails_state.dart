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

final class SetCartAdding extends ProductDatailsState {
  // final String id;

  // SetCartAdding({required this.id});
}

final class SetCartAdded extends ProductDatailsState {
  final ProductModels product;

  SetCartAdded({required this.product});
}

final class SetCartError extends ProductDatailsState {
  final String message;

  SetCartError({required this.message});
}

final class QuantityChanged extends ProductDatailsState {
  final int quantity;

  QuantityChanged(this.quantity);
}
