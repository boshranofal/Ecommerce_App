//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'dart:developer';

import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/Auth_services.dart';
import 'package:ecommerce_app/services/favorite_service.dart';
import 'package:ecommerce_app/services/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tap_state.dart';

class HomeTapCubit extends Cubit<HomeTapState> {
  final homeSrevice = HomeService();
  final favoritService = FavoriteService();
  final authService = AuthServices();
  HomeTapCubit() : super(HomeInitial());

  Future<void> getHomeDate() async {
    emit(HomeLoading());
    try {
      final products = await homeSrevice.getProducts();
      final images = await homeSrevice.getProducts();
      final imagesUrl = images.map((e) => e.toString()).toList();
      log("images: $images");
      // for (var product in dummyProducts) {
      //   await homeSrevice.setproduct(product);
      // }
      emit(HomeLoaded(products: products, imgList: imagesUrl));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  void getcategory() {
    //print("getcategory");
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final category = dummyCategories;
      //print("CategoryLoded");
      emit(CategoryLoaded(categories: category));
    });
  }

  Future<void> toggleFavorie(ProductModels product) async {
    emit(SetFavoritLoading(favoritid: product.id));
    try {
      final currrent = authService.currentUser;
      final favoritProduct = await favoritService.getFavorite(currrent!.uid);

      if (favoritProduct.contains(product)) {
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
