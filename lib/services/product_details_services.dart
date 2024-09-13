import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class ProductDetailsServices {
  final fireStoreService = FirestoreServices.instance;

  Future<ProductModels> getProductDetails(String productId) async =>
      await fireStoreService.getDocument(
        path: ApiPath.products(productId),
        builder: (data, documentId) => ProductModels.fromMap(data, documentId),
      );
}
