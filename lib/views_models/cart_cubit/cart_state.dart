part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartModel> cart;
  final double total;
  final int shipping;
  final double subtotal;

  CartLoaded(
      {required this.cart,
      required this.total,
      required this.shipping,
      required this.subtotal});
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

final class Removing extends CartState {}

final class Removed extends CartState {
  // final List<CartModel> cart;
  // Removed({required this.cart});
}

final class QuantityChanging extends CartState {
  final String cartItemId;

  QuantityChanging(this.cartItemId);
}

final class QuantityChanged extends CartState {
  final int counter;
  final String cartItemId;
  QuantityChanged(this.counter, this.cartItemId);
}
