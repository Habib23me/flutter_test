import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/product/bloc/products_bloc.dart';
import 'package:flutter_exam/product/data_provider/product_data_source.dart';
import 'package:flutter_exam/product/repository/product_repository.dart';
import 'package:flutter_exam/product_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  var productRepository = ProductRepository(
    productDataProvider: ProductDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      productRepository: productRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  const MyApp({Key key, @required this.productRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: productRepository,
      child: BlocProvider(
        create: (context) => ProductsBloc(
          productRepository: RepositoryProvider.of<ProductRepository>(context),
        ),
        child: MaterialApp(
          home: ProductScreen(),
        ),
      ),
    );
  }
}
