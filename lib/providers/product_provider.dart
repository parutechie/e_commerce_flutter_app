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
