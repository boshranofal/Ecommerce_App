class CatugoryModels {
  final String imgUrl;
  final String name;
  final String id;

  CatugoryModels({required this.imgUrl, required this.name, required this.id});
}

List<CatugoryModels> dummyCategories = [
  CatugoryModels(
      imgUrl: 'assets/images/airpods.png', name: 'Electronics', id: '1'),
  CatugoryModels(
      imgUrl: 'assets/images/clothess.jpg', name: 'Clothes', id: '2'),
  CatugoryModels(imgUrl: 'assets/images/books.jpg', name: 'Books', id: '3'),
  CatugoryModels(
      imgUrl: 'assets/images/Furniture.jpeg', name: 'Furniture', id: '4'),
  CatugoryModels(imgUrl: 'assets/images/shoess.jpg', name: 'Shoes', id: '5'),
];
