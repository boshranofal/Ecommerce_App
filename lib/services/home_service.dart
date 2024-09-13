import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class HomeService {
  final fireStoreService = FirestoreServices.instance;
  Future<List<ProductModels>> getProducts() async {
    return await fireStoreService.getCollection<ProductModels>(
      path: ApiPath.product(),
      builder: (data, documentId) => ProductModels.fromMap(data, documentId),
    );
  }

  Future<void> setproduct(ProductModels product) async {
    await fireStoreService.setData(
        path: ApiPath.products(product.id), data: product.toMap());
  }

  Future<List<String>> getImages() async {
    // Retrieve the collection of image URLs
    final querySnapshot = await fireStoreService.getCollection(
      path: ApiPath.imgaes(),
      builder: (data, documentId) =>
          data['img'].toString(), // Extract the 'img' field
    );

    // Map each document in the snapshot to a string (the image URL)
    List<String> imageUrls =
        querySnapshot.map((doc) => doc.toString()).toList();

    return imageUrls; // Return the list of image URLs
  }
}
