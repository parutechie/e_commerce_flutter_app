// import 'package:flutter/material.dart';
// import 'package:infinity/controllers/product_controller.dart';
// import 'package:infinity/models/product_model.dart';

// class ProductProvider with ChangeNotifier {
//   final ProductController _productController = ProductController();
//   List<ProductModel> _products = [];

//   List<ProductModel> get products => _products;

//   Future<void> loadProducts() async {
//     _products = await _productController.fetchProducts();
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:infinity/models/product_model.dart';
import 'package:infinity/services/product_api_service.dart';

class ProductProvider with ChangeNotifier {
  Map<String, List<ProductModel>> productsByCategory = {};

  Future<void> loadProductsByCategory() async {
    try {
      productsByCategory = await ProductApiService().getProductsByCategory();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
