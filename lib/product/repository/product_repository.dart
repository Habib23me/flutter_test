import 'package:flutter_exam/product/data_provider/product_data_source.dart';
import 'package:meta/meta.dart';
import '../product_model.dart';

class ProductRepository {
  final ProductDataProvider productDataProvider;

  ProductRepository({@required this.productDataProvider})
      : assert(productDataProvider != null);

  Future<List<Product>> getProducts() => productDataProvider.getProducts();
}
