class ApiPath {
  static String product() => 'products/';
  static String products(String productid) => 'products/$productid';
  static String imgaes() => 'images/';
  static String users() => 'users/';
  static String user(String uid) => 'users/$uid';

  static String favorites(String uid) => 'favorite/$uid';
  static String favorite(String uid, String favoriteId) =>
      'users/$uid/favorite/$favoriteId';
}
