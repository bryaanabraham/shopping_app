import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  //list of maps containing strings associated with a dynamic value ... Eg: {'size' : '9', 'imageUrl':'fqjnfew'}
  final List<Map<String, dynamic>> cart = [];
  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void rmProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
