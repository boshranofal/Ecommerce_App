// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/product_models.dart';

class CartModel {
  final String id;
  final ProductModels productCart;
  final double price;
  final int quantity;
  final bool iscart;

  CartModel({
    required this.id,
    required this.productCart,
    required this.price,
    required this.quantity,
    this.iscart = false,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'productCart': productCart.toMap()});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productCart: ProductModels.fromMap(map['productCart'], map['id']),
      id: map['id'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 1,
    );
  }

  CartModel copyWith({
    String? id,
    ProductModels? productCart,
    double? price,
    int? quantity,
    bool? iscart,
  }) {
    return CartModel(
      id: id ?? this.id,
      productCart: productCart ?? this.productCart,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      iscart: iscart ?? this.iscart,
    );
  }
}

List<CartModel> dummyCart = [];
