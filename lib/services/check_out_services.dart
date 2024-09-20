import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/models/payment_method_model.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_path.dart';

class CheckOutServices {
  final firestoreServices = FirestoreServices.instance;

  Future<List<AddressModel>> getShippingAddresses(String userId,
          [bool chosenAddress = false]) async =>
      await firestoreServices.getCollection(
        path: ApiPath.addresses(userId),
        builder: (data, documentId) => AddressModel.fromMap(data),
        queryBuilder: chosenAddress == true
            ? (query) => query.where('isChosen', isEqualTo: true)
            : null,
      );

  Future<List<CartModel>> getCartItems(String userId) async =>
      await firestoreServices.getCollection(
        path: ApiPath.cart(userId),
        builder: (data, documentId) => CartModel.fromMap(data),
      );

  Future<List<PaymentMethodModel>> getPaymentMethods(String userId,
          [bool chosenPayment = false]) async =>
      await firestoreServices.getCollection(
        path: ApiPath.paymentMethods(userId),
        builder: (data, documentId) => PaymentMethodModel.fromMap(data),
        queryBuilder: chosenPayment == true
            ? (query) => query.where('isChosen', isEqualTo: true)
            : null,
      );
}
