// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/product_models.dart';

class CartModel {
  final String id;
  final ProductModels productCart;
  final double price;
  final int quantity;

  CartModel({
    required this.id,
    required this.productCart,
    required this.price,
    required this.quantity,
  });
}

List<CartModel> dummyCart = [];
