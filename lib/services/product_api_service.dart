import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinity/models/product_model.dart';

class ProductApiService {
  final String apiUrl = 'https://dummyjson.com/products';

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['products'];
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
