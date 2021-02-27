import 'dart:convert';

import 'package:meta/meta.dart';
import '../product_model.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider {
  final http.Client httpClient;
  ProductDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Product>> getProducts() async {
    var response = await httpClient.get("https://fakestoreapi.com/products");
    if (response.statusCode != 200) {
      throw Exception("Failed to load");
    }
    return jsonDecode(response.body)
        .map<Product>((e) => Product.fromJson(e))
        .toList();
  }

  Future<Product> updateProduct(Product product) async {
    var response = await httpClient.post(
      "https://fakestoreapi.com/products",
      body: jsonEncode(
        product.toJson(),
      ),
    );
  }
}
