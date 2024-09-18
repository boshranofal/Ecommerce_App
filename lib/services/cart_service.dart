import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';
import 'package:flutter/foundation.dart';

class CartService {
  final fireStoreService = FirestoreServices.instance;

  Future<List<CartModel>> getCarItem(String userId) async =>
      await fireStoreService.getCollection<CartModel>(
        path: ApiPath.cart(userId),
        builder: (data, documentId) => CartModel.fromMap(data),
      );

  Future<void> addCart(String userId, CartModel cart) async =>
      await fireStoreService.setData(
        path: ApiPath.cart(userId),
        data: cart.toMap(),
      );

  Future<void> setCounter(String userId, String cartId, int quantity) async {
    debugPrint('Setting counter for $cartId with quantity $quantity');
    await fireStoreService.updateData(
      path: ApiPath.cartItem(userId, cartId),
      data: {'quantity': quantity},
    );
  }

  Future<void> removeCart(String userId, String cartId) async =>
      await fireStoreService.deleteData(path: ApiPath.cartItem(userId, cartId));
}
