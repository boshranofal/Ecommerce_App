part of 'home_tap_cubit.dart';

sealed class HomeTapState {}

final class HomeInitial extends HomeTapState {}

final class HomeLoading extends HomeTapState {}

final class HomeLoaded extends HomeTapState {
  final List<ProductModels> products;
  final List<String> imgList;

  HomeLoaded({required this.products, required this.imgList});
}

final class HomeError extends HomeTapState {
  final String message;

  HomeError({required this.message});
}

final class CategoryLoading extends HomeTapState {}

final class CategoryLoaded extends HomeTapState {
  final List<CatugoryModels> categories;

  CategoryLoaded({required this.categories});
}

final class CategoryError extends HomeTapState {
  final String message;

  CategoryError({required this.message});
}

final class SetFavoritLoading extends HomeTapState {
  final String favoritid;

  SetFavoritLoading({required this.favoritid});
}

final class SetFavoritSuccess extends HomeTapState {
  final String favoritid;
  final bool isFavorit;

  SetFavoritSuccess({required this.favoritid, required this.isFavorit});
}

final class SetFavoritError extends HomeTapState {
  final String message;

  SetFavoritError({required this.message});
}
