import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/cart_view_model.dart';
import 'package:ebuy/core/viewmodel/control_view_model.dart';
import 'package:ebuy/helper/binding.dart';
import 'package:ebuy/view/auth/login_screen.dart';
import 'package:ebuy/view/auth/register_screen.dart';
import 'package:ebuy/view/cart_screen.dart';
import 'package:ebuy/view/home_screen.dart';
import 'package:ebuy/view/control_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(ControlViewModel());
  // Get.put(LocalStorageData());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent
            //color set to transperent or set your own color
            ));
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: primaryColor,
        errorColor: primaryRed,
      ),
      debugShowCheckedModeBanner: false,
      title: 'E-Buy',
      getPages: [
        GetPage(name: '/splash', page: () => ControlScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
      initialRoute: '/splash',
    );
  }
}
