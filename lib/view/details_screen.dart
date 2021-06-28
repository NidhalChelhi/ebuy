import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/cart_view_model.dart';
import 'package:ebuy/core/viewmodel/control_view_model.dart';
import 'package:ebuy/helper/extension.dart';
import 'package:ebuy/model/cart_product_model.dart';
import 'package:ebuy/model/product_model.dart';
import 'package:ebuy/view/widgets/custom_button.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:ebuy/view/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  ProductModel productModel;
  DetailsScreen({this.productModel});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _imagesCarousel(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: productModel.name,
                                  color: darkColor,
                                  alignment: Alignment.centerLeft,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                  onTap: () => controller.toggleFavourite(),
                                  child: Icon(
                                    controller.favourite
                                        ? Icons.favorite
                                        : UniconsLine.heart_alt,
                                    color: controller.favourite
                                        ? primaryRed
                                        : greyColor,
                                    size: 28,
                                  ))
                            ],
                          ),
                          SizedBox(height: 16),
                          CustomRatingBar(
                            size: 16,
                            rate: productModel.rating.toDouble(),
                            padding: 2.5,
                          ),
                          SizedBox(height: 24),
                          CustomText(
                            text: productModel.price + " \TND ",
                            color: primaryColor,
                            alignment: Alignment.centerLeft,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 36),
                          CustomText(
                            text: "Select Size",
                            color: darkColor,
                            alignment: Alignment.centerLeft,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          _sizeSelect(),
                          SizedBox(height: 36),
                          CustomText(
                            text: "Select Color",
                            color: darkColor,
                            alignment: Alignment.centerLeft,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          _colorSelect(),
                          SizedBox(height: 36),
                          CustomText(
                            text: "Description",
                            color: darkColor,
                            alignment: Alignment.centerLeft,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 16),
                          CustomParagraph(
                            text: productModel.description,
                            color: greyColor,
                            alignment: Alignment.centerLeft,
                            fontSize: 14,
                          ),
                          SizedBox(height: 36),
                          // CustomText(
                          //   text: "Reviews",
                          //   color: darkColor,
                          //   alignment: Alignment.centerLeft,
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          // SizedBox(height: 16),
                          // CustomParagraph(
                          //   text: productModel.description,
                          //   color: greyColor,
                          //   alignment: Alignment.centerLeft,
                          //   fontSize: 14,
                          // ),
                          // SizedBox(height: 36),
                          GetBuilder<ControlViewModel>(
                              builder: (navcontroller) => CustomButton(
                                  label: "Add To Cart",
                                  color: primaryBlue,
                                  textColor: whiteColor,
                                  onPressed: () {
                                    controller.addToCart(CartProductModel(
                                        pid: productModel.pid,
                                        name: productModel.name,
                                        price: productModel.price,
                                        quantity: 1,
                                        image: productModel.images[0],
                                        favourite: controller.favourite ? 1 : 0,
                                        color: productModel.colors[
                                            controller.selectedColorValue],
                                        size: productModel.sizes[
                                            controller.selectedSizeValue]));
                                    navcontroller.changeSelectedValue(2);
                                    Get.back();
                                  })),

                          SizedBox(height: 38),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget _imagesCarousel() {
    return Stack(
      children: [
        Container(
            width: Get.width,
            height: 238,
            child: CarouselSlider.builder(
                itemCount: productModel.images.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int itemIndexx) {
                  return Container(
                    child: Image.network(productModel.images[itemIndex]),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ))),
        Positioned(
            top: 40,
            left: 0,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                UniconsLine.angle_left_b,
                color: greyColor,
                size: 28,
              ),
            )),
      ],
    );
  }

  Widget _sizeSelect() {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 48,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 16),
          itemCount: productModel.sizes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.selectSize(index);
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: index != controller.selectedSizeValue
                          ? lightColor
                          : primaryColor),
                ),
                child: CustomText(
                  text: productModel.sizes[index],
                  color: darkColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _colorSelect() {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 48,
        child: ListView.builder(
          itemCount: productModel.colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.selectColor(index);
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: lightColor),
                    color: HexColor.fromHex(productModel.colors[index])),
                child: index == controller.selectedColorValue
                    ? Center(
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.transparent, width: 0.0),
                              color: whiteColor),
                        ),
                      )
                    : SizedBox(),
              ),
            );
          },
        ),
      ),
    );
  }
}
