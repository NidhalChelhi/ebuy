import 'package:ebuy/core/services/database/cart_database_helper.dart';
import 'package:ebuy/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  // List<CartProductModel> get cartProducts => _cartProducts;
  // List<CartProductModel> _cartProducts = [];

  int get selectedSizeValue => _selectedSizeValue;
  int get selectedColorValue => _selectedColorValue;
  bool get favourite => _favourite;
  List<CartProductModel> get cartProducts => _cartProducts;
  double get totalePrice => _totalePrice;

  int _selectedSizeValue = 0;
  int _selectedColorValue = 0;
  bool _favourite = false;
  List<CartProductModel> _cartProducts = [];
  double _totalePrice = 0.0;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getCartProducts();
  }

  void toggleFavourite() {
    _favourite = !_favourite;
    update();
  }

  void selectSize(int selectedSizeValue) {
    _selectedSizeValue = selectedSizeValue;
    update();
  }

  void selectColor(int selectedColorValue) {
    _selectedColorValue = selectedColorValue;
    update();
  }

  getCartProducts() async {
    _loading.value = true;

    _cartProducts = await dbHelper.getCartProducts();

    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalePrice +=
          (double.parse(_cartProducts[i].price) * _cartProducts[i].quantity);
      update();
    }
  }

  addToCart(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].pid == cartProductModel.pid &&
          _cartProducts[i].color == cartProductModel.color &&
          _cartProducts[i].size == cartProductModel.size) {
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProducts.add(cartProductModel);
    _totalePrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
  }

  removeProduct(
    int index,
  ) async {
    _totalePrice -= (double.parse(_cartProducts[index].price) *
        _cartProducts[index].quantity);
    await dbHelper.deleteProduct(_cartProducts[index]);
    update();
  }

  increaseProductQte(
    int index,
  ) async {
    _cartProducts[index].quantity++;
    _totalePrice += double.parse(_cartProducts[index].price);
    await dbHelper.updateProduct(_cartProducts[index]);
    update();
  }

  decreaseProductQte(
    int index,
  ) async {
    _cartProducts[index].quantity--;
    _totalePrice -= double.parse(_cartProducts[index].price);
    await dbHelper.updateProduct(_cartProducts[index]);

    update();
  }
}
