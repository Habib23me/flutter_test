part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductLoaded extends ProductsState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductsState {
  final error;

  ProductError(this.error);
}
