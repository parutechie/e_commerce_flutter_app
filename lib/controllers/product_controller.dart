import 'package:infinity/models/product_model.dart';
import 'package:infinity/services/product_api_service.dart';

class ProductController {
  final ProductApiService _apiService = ProductApiService();

  Future<List<ProductModel>> fetchProducts() async {
    return await _apiService.getProducts();
  }
}
