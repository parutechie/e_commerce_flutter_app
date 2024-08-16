import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinity/models/product_model.dart';

class ProductApiService {
  final String apiUrl = 'https://dummyjson.com/products';

  Future<Map<String, List<ProductModel>>> getProductsByCategory() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['products'];
      List<ProductModel> products =
          data.map((json) => ProductModel.fromJson(json)).toList();

      // Group products by category
      Map<String, List<ProductModel>> productsByCategory = {};
      for (var product in products) {
        if (!productsByCategory.containsKey(product.category)) {
          productsByCategory[product.category] = [];
        }
        productsByCategory[product.category]!.add(product);
      }
      return productsByCategory;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
