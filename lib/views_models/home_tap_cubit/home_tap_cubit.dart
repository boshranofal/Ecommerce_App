//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/Auth_services.dart';
import 'package:ecommerce_app/services/category_service.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/services/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tap_state.dart';

class HomeTapCubit extends Cubit<HomeTapState> {
  HomeTapCubit() : super(HomeInitial());

  final homeSrevice = HomeService();
  final favoritService = FavoriteService();
  final authService = AuthServices();
  final categoryService = CategoryService();

  Future<void> getHomeDate() async {
    emit(HomeLoading());
    try {
      final products = await homeSrevice.getProducts();
      final current = authService.currentUser;
      final favoritProduct = await favoritService.getFavorite(current!.uid);

      for (var product in products) {
        if (favoritProduct.any((element) => element.id == product.id)) {
          final indrx = products.indexOf(product);
          product = product.copyWith(isFaviorite: true);
          products[indrx] = product;
        } else {
          product = product.copyWith(isFaviorite: false);
        }
      }
      final images = await homeSrevice.getImages();
      final imagesUrl = images.map((e) => e.toString()).toList();
      //log("images: $images");
      emit(HomeLoaded(products: products, imgList: imagesUrl));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> getcategory() async {
    emit(CategoryLoading());
    try {
      final category = await categoryService.getCategories();
      emit(CategoryLoaded(categories: category));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future<void> toggleFavorie(ProductModels product) async {
    emit(SetFavoritLoading(favoritid: product.id));
    try {
      final currrent = authService.currentUser;
      final favoritProduct = await favoritService.getFavorite(currrent!.uid);

      if (favoritProduct.any((element) => element.id == product.id)) {
        await favoritService.removeFavorite(currrent.uid, product.id);
        emit(SetFavoritSuccess(favoritid: product.id, isFavorit: false));
      } else {
        await favoritService.addFavarite(currrent.uid, product);
        emit(SetFavoritSuccess(favoritid: product.id, isFavorit: true));
      }
    } catch (e) {
      emit(SetFavoritError(message: e.toString()));
    }
  }
}
