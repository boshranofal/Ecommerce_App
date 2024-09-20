import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/check_out_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  final authServices = AuthServices();
  final checkoutServices = CheckOutServices();

  Future<void> getCheckoutData() async {
    emit(CheckOutLoading());
    try {
      final currentUser = authServices.currentUser;
      final shippingAddresses =
          await checkoutServices.getShippingAddresses(currentUser!.uid, true);
      final chosenShippingAddress =
          shippingAddresses.isNotEmpty ? shippingAddresses.first : null;

      final cartOrders = await checkoutServices.getCartItems(currentUser.uid);
      final totalAmount = cartOrders.fold<double>(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.productCart.price * element.quantity)) +
          10;

      final paymentMethods =
          await checkoutServices.getPaymentMethods(currentUser.uid, true);
      final chosenPaymentMethod =
          paymentMethods.isNotEmpty ? paymentMethods.first : null;
      emit(
        CheckOutLoaded(
          preferredPaymentMethod: chosenPaymentMethod,
          preferredLocation: chosenShippingAddress,
          cart: cartOrders,
          total: totalAmount,
        ),
      );
    } catch (e) {
      emit(CheckOutError(message: e.toString()));
    }
  }

  void getpaymentMethods() async {
    emit(PaymentLoading());
    try {
      final currentUser = authServices.currentUser;

      final cartOrders = await checkoutServices.getCartItems(currentUser!.uid);
      final totalAmount = cartOrders.fold<double>(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.productCart.price * element.quantity)) +
          10;

      emit(PaymentLoaded(cart: cartOrders, total: totalAmount));
    } catch (e) {
      emit(PaymentError(message: e.toString()));
    }
  }
}
