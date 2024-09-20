import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/cart_models.dart';
//import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final authservice = AuthServices();
  final cartService = CartService();

  Future<void> getItems() async {
    emit(CartLoading());
    try {
      final currentUser = authservice.currentUser;
      final getCart = await cartService.getCarItem(currentUser!.uid);
      final subtitle = getCart.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.price),
      );
      const shipping = 10;
      final total = subtitle + shipping;
      emit(CartLoaded(
          cart: getCart, total: total, shipping: shipping, subtotal: subtitle));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> incrementCounter(
      int previousValue, String cartItemId, String userId) async {
    emit(QuantityChanging(cartItemId));
    var newValue = ++previousValue;

    await cartService.setCounter(userId, cartItemId, newValue);

    emit(QuantityChanged(newValue, cartItemId));
  }

  Future<void> decrementCounter(
      int previousValue, String cartItemId, String userId) async {
    emit(QuantityChanging(cartItemId));
    var newValue = --previousValue;

    await cartService.setCounter(userId, cartItemId, newValue);

    emit(QuantityChanged(newValue, cartItemId));
  }

  Future<void> remove(
    CartModel product,
  ) async {
    emit(Removing(cartId: product.id));

    final currentUser = authservice.currentUser;
    await cartService.removeCart(currentUser!.uid, product.id);
    emit(Removed(cartId: product.id));
    // }
  }
}
