//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tap_state.dart';

class HomeTapCubit extends Cubit<HomeTapState> {
  final List<String> imgList = [
    'assets/images/shooping.png',
    'assets/images/ecommerce.png',
  ];
  HomeTapCubit() : super(HomeInitial());

  void getHomeDate() {
    print("getHomeDate");
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final product = dummyProducts;
      print("HomeLoded");
      emit(HomeLoaded(imgurls: imgList, products: product));
    });
  }

  void getcategory() {
    print("getcategory");
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 1), () {
      final category = dummyCategories;
      print("CategoryLoded");
      emit(CategoryLoaded(categories: category));
    });
  }

  void toggleFavorie(ProductModels product) {
    emit(SetFavoritLoading(favoritid: product.id));
    Future.delayed(const Duration(milliseconds: 500), () {
      if (dummyFavorite.contains(product)) {
        dummyFavorite.remove(product);
        emit(SetFavoritSuccess(favoritid: product.id, isFavorit: false));
      } else {
        dummyFavorite.add(product);
        emit(SetFavoritSuccess(favoritid: product.id, isFavorit: true));
      }
    });
  }
}
