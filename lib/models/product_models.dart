import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:flutter/foundation.dart';

class ProductModels {
  final String name;
  final String description;
  final String image;
  final double price;
  final String id;
  final CatugoryModels category;

  ProductModels(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.id,
      required this.category});
}

List<ProductModels> dummyFavorite = [];
List<ProductModels> dummyProducts = [
  ProductModels(
      name: 'Iphone 12',
      description: 'Iphone 12 with 128GB',
      image: 'https://pngimg.com/d/men_shoes_PNG7475.png',
      price: 799.99,
      id: '1',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Macbook Pro',
      description: 'Macbook Pro 2021',
      image:
          'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
      price: 1299.99,
      id: '2',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Ipad Pro',
      description: 'Ipad Pro 2021',
      image:
          'https://parspng.com/wp-content/uploads/2022/12/tomatopng.parspng.com-6.png',
      price: 999.99,
      id: '3',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Apple Watch',
      description: 'Apple Watch Series 6',
      image:
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      price: 399.99,
      id: '4',
      category: dummyCategories[0]),
  ProductModels(
      name: 'Apple Airpods',
      description: 'Apple Airpods Pro',
      image:
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      price: 199.99,
      id: '5',
      category: dummyCategories[0]),
  ProductModels(
      name: 'T-shirt',
      description: 'White T-shirt',
      image:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      price: 19.99,
      id: '6',
      category: dummyCategories[1]),
  ProductModels(
      name: 'Jeans',
      description: 'Blue Jeans',
      image:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 29.99,
      id: '7',
      category: dummyCategories[1]),
  ProductModels(
      name: 'Shoes',
      description: 'Black Shoes',
      image:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 49.99,
      id: '8',
      category: dummyCategories[1]),
  ProductModels(
      name: 'Books',
      description: 'Books',
      image:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      price: 9.99,
      id: '9',
      category: dummyCategories[2]),
];
