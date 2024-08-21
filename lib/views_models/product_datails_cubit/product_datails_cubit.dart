import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_datails_state.dart';

class ProductDatailsCubit extends Cubit<ProductDatailsState> {
  ProductDatailsCubit() : super(ProductDatailsInitial());

  void getProductDetails(ProductModels product) {
    emit(ProductDatailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProductDatailsLoaded(product: product));
    });
  }

  void incrementCounter(ProductModels product) {
    product.incrementCounter();
    emit(ProductDatailsLoaded(product: product));
  }

  void decrementCounter(ProductModels product) {
    product.decrementCounter();
    emit(ProductDatailsLoaded(product: product));
  }

  void selectColor(ProductModels product, int index) {
    product.selectColor(index);
    emit(ProductDatailsLoaded(product: product));
  }

  void addcart() {
    emit(Adding());
    Future.delayed(const Duration(seconds: 1), () {
      final addCart = dummyCart;
      emit(Added(product: addCart));
    });
  }

  void togglecart(ProductModels product) {
    //emit(ProductDatailsLoaded(product: product));
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!dummyCart.contains(product)) {
        dummyCart.add(product);
        emit(ProductDatailsLoaded(product: product));
      }
    });
  }

  void remove(ProductModels product) {
    emit(Adding());
    Future.delayed(const Duration(milliseconds: 100), () {
      dummyCart.remove(product);
      emit(Added(product: dummyCart));
    });
  }
}
