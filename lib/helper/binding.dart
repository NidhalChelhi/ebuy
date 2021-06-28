import 'package:ebuy/core/viewmodel/auth_view_model.dart';
import 'package:ebuy/core/viewmodel/cart_view_model.dart';
import 'package:ebuy/core/viewmodel/control_view_model.dart';
import 'package:ebuy/core/viewmodel/home_view_model.dart';
import 'package:ebuy/helper/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => LocalStorageData());

    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
