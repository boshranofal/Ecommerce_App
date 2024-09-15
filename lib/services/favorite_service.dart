import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class FavoriteService {
  final fireStoreService = FirestoreServices.instance;

  Future<void> addFavarite(String uid, ProductModels product) async =>
      await fireStoreService.setData(
          path: ApiPath.favoriteItem(uid, product.id), data: product.toMap());

  Future<void> removeFavorite(String uid, String productId) async =>
      await fireStoreService.deleteData(
          path: ApiPath.favoriteItem(uid, productId));

  Future<List<ProductModels>> getFavorite(String uid) async =>
      await fireStoreService.getCollection(
          path: ApiPath.favorites(uid),
          builder: (data, documentId) =>
              ProductModels.fromMap(data, documentId));
}
