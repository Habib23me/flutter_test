import 'dart:async';
import 'package:flutter_exam/product/repository/product_repository.dart';

import '../product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;

  ProductsBloc({@required this.productRepository})
      : assert(productRepository != null),
        super(ProductsInitialState());

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    try {
      if (event is LoadProducts) {
        yield ProductLoading();
        final products = await productRepository.getProducts();
        yield ProductLoaded(products);
      }
    } catch (e) {
      yield ProductError(e);
    }
  }
}
