class ApiPath {
  static String product() => 'products/';
  static String products(String productid) => 'products/$productid';
  static String imgaes() => 'images/';

  static String users() => 'users/';
  static String user(String userId) => 'users/$userId';

  static String favorites(String userId) => 'users/$userId/favorites/';
  static String favoriteItem(String userId, String favoriteId) =>
      'users/$userId/favorites/$favoriteId';

  static String cart(String userId) => 'users/$userId/cart/';
  static String cartItem(String userId, String itemId) =>
      'users/$userId/cart/$itemId';

  static String category() => 'category/';
  static String categoryItem(String categoryId) => 'category/$categoryId';

  static String details(String userId) => 'users/$userId/details/';
  static String detailItem(String userId, String detailId) =>
      'users/$userId/details/$detailId';

  static String addresses(String uid) => 'users/$uid/addresses/';
  static String paymentMethods(String uid) => 'users/$uid/paymentMethods/';
}
