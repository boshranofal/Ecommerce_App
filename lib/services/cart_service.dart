import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class CartService {
  final fireStoreService = FirestoreServices.instance;

  Future<List<CartModel>> getCarItem(String userId) async =>
      await fireStoreService.getCollection<CartModel>(
        path: ApiPath.cart(userId),
        builder: (data, documentId) => CartModel.fromMap(data),
      );

  Future<void> addCart(String userId, CartModel cart) async =>
      await fireStoreService.setData(
        path: ApiPath.cartItem(userId, cart.id),
        data: cart.toMap(),
      );
}
