part of 'check_out_cubit.dart';

sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutLoading extends CheckOutState {}

final class CheckOutLoaded extends CheckOutState {
  final List<CartModel> cart;
  final AddressModel? preferredLocation;
  final PaymentMethodModel? preferredPaymentMethod;
  final double total;

  CheckOutLoaded({
    required this.cart,
    required this.preferredLocation,
    required this.preferredPaymentMethod,
    required this.total,
  });
}

final class CheckOutError extends CheckOutState {
  final String message;

  CheckOutError({required this.message});
}

final class PaymentLoading extends CheckOutState {}

final class PaymentLoaded extends CheckOutState {
  final List<CartModel> cart;
  final double total;

  PaymentLoaded({required this.cart, required this.total});
}

final class PaymentError extends CheckOutState {
  final String message;

  PaymentError({required this.message});
}
