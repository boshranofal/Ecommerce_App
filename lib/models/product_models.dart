import 'package:ecommerce_app/models/catugory_models.dart';

//import 'package:flutter/foundation.dart';

class ProductModels {
  final String name;
  final String description;
  final String image;
  final double price;
  final String id;
  //final CatugoryModels category;
  final String details =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry';
  //int quantity = 1;
  int selectecolor = 0;

  ProductModels({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.id,
    //required this.category,
  });
  void selectColor(int index) {
    selectecolor = index;
  }

  ProductModels copyWith({
    String? name,
    String? description,
    String? image,
    double? price,
    String? id,
    CatugoryModels? category,
  }) {
    return ProductModels(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      id: id ?? this.id,
      //category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    final result = Map<String, dynamic>();

    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image': image});
    result.addAll({'price': price});
    result.addAll({'id': id});
    //result.addAll({'category': category});
    return result;
  }

  factory ProductModels.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductModels(
      id: documentId,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      //category: map['category'] ?? CatugoryModels(name: '', id: '', imgUrl: ''),
    );
  }
}

List<ProductModels> dummyFavorite = [];

List<ProductModels> dummyProducts = [
  ProductModels(
    name: 'Ipad Pro',
    description: 'Ipad Pro 2021',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/ipad.png',
    price: 799.99,
    id: '1',
  ),
  // category: dummyCategories[0]),
  ProductModels(
    name: 'Iphon 14',
    description: 'Iphone 14 Pro Max',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/iphone.png',
    price: 1299.99,
    id: '2',
    //category: dummyCategories[0]
  ),
  ProductModels(
    name: 'Apple Labtop ',
    description: 'Laptop Apple Macbook Pro',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/laptop.png',
    price: 999.99,
    id: '3',
    //category: dummyCategories[0]
  ),
  ProductModels(
    name: 'Apple Watch',
    description: 'Apple Watch Series 6',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/watch.png',
    price: 399.99,
    id: '4',
    //category: dummyCategories[0]
  ),
  ProductModels(
    name: 'Apple Airpods',
    description: 'Apple Airpods Pro',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/Airpods%20(2).png',
    price: 199.99,
    id: '5',
    // category: dummyCategories[0]
  ),
  ProductModels(
    name: 'dress',
    description: 'Girl Dress',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/baby_girl.png',
    price: 29.99,
    id: '7',
    // category: dummyCategories[1]
  ),
  ProductModels(
    name: 'shirt',
    description: 'Boy Shirt',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/boy.png',
    price: 29.99,
    id: '8',
    //category: dummyCategories[1]
  ),
  ProductModels(
    name: 'Heels Shoes',
    description: 'Black Shoes',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/heels_shoes.png',
    price: 49.99,
    id: '9',
    //category: dummyCategories[3]
  ),
  ProductModels(
    name: 'Boot Shoes',
    description: 'Black Shoes',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/boot.png',
    price: 39.99,
    id: '10',
    //category: dummyCategories[3]
  ),
  ProductModels(
    name: 'Bag',
    description: 'Pink Bag',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/Bag_girl.png',
    price: 49.99,
    id: '11',
    // category: dummyCategories[2],
  ),
  ProductModels(
    name: 'Hand Bag',
    description: 'girl hand bag',
    image:
        'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/bag.jpg',
    price: 59.99,
    id: '12',
    //category: dummyCategories[2],
  )
];
