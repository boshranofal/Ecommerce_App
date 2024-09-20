class AddressModel {
  final String id;
  final String imgUrl;
  final String name;
  final String address;
  final bool isFav;

  const AddressModel({
    required this.id,
    this.imgUrl =
        'https://previews.123rf.com/images/emojoez/emojoez1903/emojoez190300018/119684277-illustrations-design-concept-location-maps-with-road-follow-route-for-destination-drive-by-gps.jpg',
    required this.name,
    required this.address,
    this.isFav = false,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'name': name});
    result.addAll({'address': address});
    result.addAll({'isFav': isFav});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      isFav: map['isFav'] ?? false,
    );
  }
}

List<AddressModel> dummyLocations = const [
  AddressModel(
    id: '1',
    name: 'Cairo',
    address: 'Egypt',
  ),
  AddressModel(
    id: '2',
    name: 'Giza',
    address: 'Egypt',
  ),
  AddressModel(
    id: '3',
    name: 'Alexandria',
    address: 'Egypt',
  ),
];
