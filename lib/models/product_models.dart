import 'package:ecommerce_app/models/catugory_models.dart';

//import 'package:flutter/foundation.dart';
enum ProductSize {
  S,
  M,
  L,
  XL,
  XXL;

  static ProductSize fromString(String size) {
    if (size == ProductSize.S.name) {
      return ProductSize.S;
    } else if (size == ProductSize.M.name) {
      return ProductSize.M;
    } else if (size == ProductSize.L.name) {
      return ProductSize.L;
    } else if (size == ProductSize.XL.name) {
      return ProductSize.XL;
    } else {
      return ProductSize.XXL;
    }
  }
}

class ProductModels {
  final String name;
  final String description;
  final String image;
  final double price;
  final String id;
  final CatugoryModels category;
  final String details =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry';
  int count = 1;

  ProductModels(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.id,
      required this.category});
}

List<ProductModels> dummyFavorite = [];
List<ProductModels> dummyCart = [];
List<ProductModels> dummyProducts = [
  ProductModels(
      name: 'Ipad Pro',
      description: 'Ipad Pro 2021',
      image: 'assets/images/ipad.png',
      price: 799.99,
      id: '1',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Iphon 14',
      description: 'Iphone 14 Pro Max',
      image: 'assets/images/iphone.png',
      price: 1299.99,
      id: '2',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Apple Labtop ',
      description: 'Laptop Apple Macbook Pro',
      image: 'assets/images/laptop.png',
      price: 999.99,
      id: '3',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Apple Watch',
      description: 'Apple Watch Series 6',
      image: 'assets/images/watch.png',
      price: 399.99,
      id: '4',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Apple Airpods',
      description: 'Apple Airpods Pro',
      image: 'assets/images/Airpods (2).png',
      price: 199.99,
      id: '5',
      category: dummyCategories[0]),
  ProductModels(
      name: 'dress',
      description: 'Girl Dress',
      image: 'assets/images/baby_girl.png',
      price: 29.99,
      id: '7',
      category: dummyCategories[1]),
  ProductModels(
      name: 'shirt',
      description: 'Boy Shirt',
      image: 'assets/images/boy.png',
      price: 29.99,
      id: '8',
      category: dummyCategories[1]),
  ProductModels(
      name: 'Heels Shoes',
      description: 'Black Shoes',
      image: 'assets/images/heels_shoes.png',
      price: 49.99,
      id: '9',
      category: dummyCategories[3]),
  ProductModels(
      name: 'Boot Shoes',
      description: 'Black Shoes',
      image: 'assets/images/boot.png',
      price: 39.99,
      id: '10',
      category: dummyCategories[3]),
  ProductModels(
    name: 'Bag',
    description: 'Pink Bag',
    image: 'assets/images/Bag_girl.png',
    price: 49.99,
    id: '11',
    category: dummyCategories[2],
  ),
  ProductModels(
    name: 'Hand Bag',
    description: 'girl hand bag',
    image: 'assets/images/handbag.png',
    price: 59.99,
    id: '12',
    category: dummyCategories[2],
  )
];
