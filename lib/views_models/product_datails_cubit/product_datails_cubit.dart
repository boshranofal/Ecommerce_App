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
}
