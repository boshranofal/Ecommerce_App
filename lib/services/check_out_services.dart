import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

abstract class CheckoutServices {
  Future<List<CartModel>> getCartItems(String uid);
  Future<List<AddressModel>> getAddresses(String uid,
      {bool fetchPreferred = false});
  Future<List<PaymentMethodModel>> getPaymentMethods(String uid,
      {bool fetchPreferred = false});
}

class CheckoutServicesImpl implements CheckoutServices {
  final firestoreService = FirestoreServices.instance;

  @override
  Future<List<CartModel>> getCartItems(String uid) async =>
      await firestoreService.getCollection<CartModel>(
          path: ApiPath.cart(uid),
          builder: (data, documentId) => CartModel.fromMap(data));
  @override
  Future<List<AddressModel>> getAddresses(String uid,
          {bool fetchPreferred = false}) async =>
      await firestoreService.getCollection<AddressModel>(
        path: ApiPath.addresses(uid),
        builder: (data, documentId) => AddressModel.fromMap(data),
        queryBuilder: fetchPreferred
            ? (query) => query.where('isFav', isEqualTo: true)
            : null,
      );

  @override
  Future<List<PaymentMethodModel>> getPaymentMethods(String uid,
          {bool fetchPreferred = false}) async =>
      await firestoreService.getCollection<PaymentMethodModel>(
        path: ApiPath.paymentMethods(uid),
        builder: (data, documentId) => PaymentMethodModel.fromMap(data),
        queryBuilder: fetchPreferred
            ? (query) => query.where('isFav', isEqualTo: true)
            : null,
      );
}
