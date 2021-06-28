import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/auth_view_model.dart';
import 'package:ebuy/core/viewmodel/control_view_model.dart';
import 'package:ebuy/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                  bottomNavigationBar: bottomNavigationBar(),
                  body: controller.currentScreen));
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => Theme(
        data: Get.context.theme.copyWith(
          canvasColor: whiteColor,
        ), //
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          backgroundColor: primaryPurple,
          selectedItemColor: primaryBlue,
          unselectedItemColor: greyColor,
          iconSize: 24,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(
                  UniconsLine.estate,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(UniconsLine.search),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(UniconsLine.shopping_basket),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Offer',
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(UniconsLine.tag_alt),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(UniconsLine.user),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
