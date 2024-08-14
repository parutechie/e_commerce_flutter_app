import 'package:flutter/material.dart';
import 'package:infinity/controllers/product_controller.dart';
import 'package:infinity/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final ProductController _productController = ProductController();
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> loadProducts() async {
    _products = await _productController.fetchProducts();
    notifyListeners();
  }
}
