class CatugoryModels {
  final String imgUrl;
  final String name;
  final String id;

  CatugoryModels({required this.imgUrl, required this.name, required this.id});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'imgUrl': imgUrl});
    result.addAll({'name': name});
    result.addAll({'id': id});
    return result;
  }

  factory CatugoryModels.fromMap(Map<String, dynamic> map, String documentId) {
    return CatugoryModels(
      id: documentId,
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

List<CatugoryModels> dummyCategories = [
  CatugoryModels(
      imgUrl:
          'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/airpods.png',
      name: 'Electronics',
      id: '1'),
  CatugoryModels(
      imgUrl:
          'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/clothess.jpg',
      name: 'Clothes',
      id: '2'),
  CatugoryModels(
      imgUrl:
          'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/bagg.jpg',
      name: 'Bag',
      id: '3'),
  CatugoryModels(
      imgUrl:
          'https://raw.githubusercontent.com/boshranofal/Ecommerce_App/refs/heads/main/assets/images/shoess.jpg',
      name: 'Shoes',
      id: '4'),
];
