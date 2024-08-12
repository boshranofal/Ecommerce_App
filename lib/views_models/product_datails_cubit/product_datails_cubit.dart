import 'package:ecommerce_app/models/product_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_datails_state.dart';

class ProductDatailsCubit extends Cubit<ProductDatailsState> {
  ProductDatailsCubit() : super(ProductDatailsInitial());

  int counter = 0;
  void getProductDetails(ProductModels product) {
    emit(ProductDatailsLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ProductDatailsLoaded(product: product));
    });
  }

  void incrementCounter() {
    counter++;
    emit(QuantityState(quantity: counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityState(quantity: counter));
  }
}
