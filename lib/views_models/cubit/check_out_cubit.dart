import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/check_out_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  final authservice = AuthServices();
  final checkoutServices = CheckoutServicesImpl();

  Future<void> getCheckOutDetails() async {
    emit(CheckOutLoading());
    try {
      final currentUser = await authservice.currentUser;
      final cartItems = await checkoutServices.getCartItems(currentUser!.uid);
      final preferredLocation = (await checkoutServices.getAddresses(
        currentUser.uid,
        fetchPreferred: true,
      ))
          .first;
      final preferredPaymentMethod = (await checkoutServices.getPaymentMethods(
        currentUser.uid,
        fetchPreferred: true,
      ))
          .first;
      final subtotal = cartItems.fold<double>(
          0,
          (sum, cartItem) =>
              sum + (cartItem.productCart.price * cartItem.quantity));
      emit(
        CheckOutLoaded(
          cart: cartItems,
          preferredLocation: preferredLocation,
          preferredPaymentMethod: preferredPaymentMethod,
          total: subtotal + 10,
        ),
      );
    } catch (e) {
      emit(CheckOutError(message: e.toString()));
    }
  }
}
