import 'dart:ui';

import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/home_view_model.dart';
import 'package:ebuy/model/category_model.dart';
import 'package:ebuy/model/product_model.dart';
import 'package:ebuy/view/details_screen.dart';
import 'package:ebuy/view/widgets/custom_header.dart';
import 'package:ebuy/view/widgets/custom_product_card.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:ebuy/view/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  Duration _duration = Duration(days: 4, hours: 7, minutes: 4, seconds: 90);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: whiteColor,
              appBar: _customAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      thickness: 1,
                      color: lightColor,
                    ),
                    SizedBox(height: 20),
                    _listViewOffers(),
                    SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          CustomHeader(
                            label: "Categories",
                            link: "",
                            linkNavigation: () {},
                          ),
                          SizedBox(height: 16),
                          _listViewCategory(),
                          SizedBox(height: 30),
                          CustomHeader(
                            label: "Recommended for you",
                            link: "See More",
                            linkNavigation: () {},
                          ),
                          SizedBox(height: 20),
                          _gridViewProducts(),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    // SizedBox(height: 10),
                    // _listViewOffers(),
                    // SizedBox(height: 18),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _customAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0, left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hint: "Search Products",
                      icon: UniconsLine.search,
                      type: TextInputType.text,
                      // onSaved: () {},
                      // validator: () {},
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(UniconsLine.heart, color: greyColor),
                  SizedBox(width: 20),
                  Icon(UniconsLine.bell, color: greyColor),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _listViewOffers() {
    return Container(
      height: 206,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 20),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    "assets/images/image 50.png",
                  ),
                ),
                Positioned(
                  top: 44,
                  left: 24,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Super Flash Sale",
                          color: whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: "50% Off",
                          color: whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SlideCountdownClock(
                          duration: _duration,
                          shouldShowDays: false,
                          slideDirection: SlideDirection.Up,
                          separator: ":",
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: darkColor,
                          ),
                          separatorTextStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 12),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            CategoryModel snapCategory = controller.categories[index];
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Image.network(
                    snapCategory.image,
                    height: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(color: lightColor),
                    color: whiteColor,
                  ),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: snapCategory.name,
                  color: greyColor,
                  fontSize: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _gridViewProducts() {
    return GetBuilder<HomeViewModel>(
        init: Get.find(),
        builder: (controller) {
          int sectionHeight = (controller.products.length / 2).round();
          return Container(
            height: sectionHeight.toDouble() * 296,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 282,
                mainAxisSpacing: 14.0,
                crossAxisCount: 2,
                crossAxisSpacing: 14.0,
              ),
              itemCount: controller.products.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                ProductModel snapProduct = controller.products[index];
                return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsScreen(productModel: snapProduct));
                    },
                    child: CustomProductCard(
                      productModel: snapProduct,
                      height: 282,
                    ));
              },
            ),
          );
        });
  }
}
