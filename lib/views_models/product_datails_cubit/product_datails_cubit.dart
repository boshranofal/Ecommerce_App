import 'dart:developer';

import 'package:ecommerce_app/models/cart_models.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/product_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_datails_state.dart';

class ProductDatailsCubit extends Cubit<ProductDatailsState> {
  ProductDatailsCubit() : super(ProductDatailsInitial());
  final authServices = AuthServices();
  final productDetailsServices = ProductDetailsServices();
  int counter = 1;
  Future<void> getProductDetails(String id) async {
    emit(ProductDatailsLoading());
    try {
      final product = await productDetailsServices.getProductDetails(id);
      emit(ProductDatailsLoaded(product: product));
    } catch (e) {
      emit(ProductDatailsError(message: e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    //print(counter);
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      --counter;
    }
    emit(QuantityChanged(counter));
  }

  void selectColor(ProductModels product, int index) {
    product.selectColor(index);
    emit(ProductDatailsLoaded(product: product));
  }

  Future<void> togglecart(ProductModels product) async {
    emit(SetCartAdding());
    try {
      final currentuser = authServices.currentUser;
      // final cartProduct =
      //     await productDetailsServices.getProductDetails(currentuser!.uid);

      final cartOrder = CartModel(
        id: DateTime.now().toIso8601String(),
        productCart: product,
        price: counter * product.price,
        quantity: counter,
      );
      await productDetailsServices.addProductToCart(
        currentuser!.uid,
        cartOrder,
      );
      emit(SetCartAdded(product: product));
    } catch (e) {
      log(e.toString());
      emit(SetCartError(message: e.toString()));
    }
  }
}
