import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class CategoryService {
  final fireStoreServices = FirestoreServices.instance;

  Future<List<CatugoryModels>> getCategories() async =>
      await fireStoreServices.getCollection<CatugoryModels>(
        path: ApiPath.category(),
        builder: (data, documentId) => CatugoryModels.fromMap(data, documentId),
      );

  Future<void> setCategory(CatugoryModels category) async {
    await fireStoreServices.setData(
        path: ApiPath.categoryItem(category.id), data: category.toMap());
  }
}
