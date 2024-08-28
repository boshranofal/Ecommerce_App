import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/cart_models.dart';
//import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getItems() {
    emit(CartLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final getCart = dummyCart;
      final subtitle = getCart.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.price),
      );
      const shipping = 10;
      final total = subtitle + shipping;
      emit(CartLoaded(
          cart: getCart, total: total, shipping: shipping, subtotal: subtitle));
    });
  }

  void incrementCounter(int previousValue, String cartItemId) {
    emit(QuantityChanging(cartItemId));
    Future.delayed(const Duration(), () {
      var newValue = ++previousValue;
      emit(QuantityChanged(newValue, cartItemId));
    });
  }

  void decrementCounter(int previousValue, String cartItemId) {
    emit(QuantityChanging(cartItemId));
    Future.delayed(const Duration(), () {
      var newValue = previousValue;
      if (previousValue > 1) {
        newValue = --newValue;
      }
      emit(QuantityChanged(newValue, cartItemId));
    });
  }

  Future<void> remove(CartModel product) async {
    emit(Removing());
    Future.delayed(const Duration(milliseconds: 100), () {
      dummyCart.remove(product);
      emit(Removed(cart: dummyCart));
    });
    // }
  }
}
