import 'package:ebuy/core/services/home_service.dart';
import 'package:ebuy/model/category_model.dart';
import 'package:ebuy/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categories => _categories;
  List<CategoryModel> _categories = [];
  List<ProductModel> get products => _products;
  List<ProductModel> _products = [];

  HomeViewModel() {
    getCategories();
    getRecommendedProducts();
  }

  getCategories() async {
    _loading.value = true;
    HomeService().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categories.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getRecommendedProducts() async {
    _loading.value = true;
    HomeService().getProductsAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        _products.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
