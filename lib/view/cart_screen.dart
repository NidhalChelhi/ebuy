import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/cart_view_model.dart';
import 'package:ebuy/core/viewmodel/control_view_model.dart';
import 'package:ebuy/helper/extension.dart';
import 'package:ebuy/model/cart_product_model.dart';
import 'package:ebuy/view/widgets/custom_button.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => Scaffold(
              backgroundColor: whiteColor,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    leading: null,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.0),
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 10.0, left: 18, right: 18),
                        child: CustomText(
                          text: "Your Cart",
                          alignment: Alignment.topLeft,
                          color: darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _listViewProducts(controller),
                    _priceSection(controller),
                  ],
                ),
              ),
            ));
  }

  Widget _priceSection(controller) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => controller.cartProducts.length == 0
          ? Container(
              height: 0,
            )
          : Container(
              padding: EdgeInsets.all(18),
              height: 254,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: lightColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Items (${controller.cartProducts.length})',
                          color: greyColor,
                          fontSize: 12,
                        ),
                        CustomText(
                          text: controller.totalePrice.toStringAsFixed(2) +
                              ' TND',
                          color: darkColor,
                          fontSize: 12,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Shipping',
                          color: greyColor,
                          fontSize: 12,
                        ),
                        CustomText(
                          text: '40' + ' TND',
                          color: darkColor,
                          fontSize: 12,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Import charges',
                          color: greyColor,
                          fontSize: 12,
                        ),
                        CustomText(
                          text: '0' + ' TND',
                          color: darkColor,
                          fontSize: 12,
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Total Price',
                          color: darkColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: controller.totalePrice.toStringAsFixed(2) +
                              " TND",
                          color: primaryBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )
                      ]),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    label: "Check Out",
                    color: primaryBlue,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _listViewProducts(controller) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => controller.cartProducts.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Empty Cart.svg",
                  height: 200,
                ),
                SizedBox(height: 24),
                CustomText(
                  text: "Empty Cart !",
                  color: darkColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 18),
                CustomParagraph(
                  text:
                      "Looks like you haven't added anything to your cart yet.",
                  color: greyColor,
                  fontSize: 12,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 24),
                GetBuilder<ControlViewModel>(
                  init: Get.find(),
                  builder: (contollerr) => CustomButton(
                      label: "Browse Products",
                      color: primaryBlue,
                      onPressed: () => contollerr.changeSelectedValue(0)),
                )
              ],
            )
          : Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: controller.cartProducts.length,
                itemBuilder: (context, index) {
                  CartProductModel snapProduct = controller.cartProducts[index];
                  return Slidable(
                    key: ObjectKey(controller.cartProducts.elementAt(index)),
                    actionPane: SlidableBehindActionPane(),
                    actionExtentRatio: 0.25,
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                      onDismissed: (actionType) async {
                        await controller.removeProduct(index);
                        setState(() {
                          controller.cartProducts.removeAt(index);
                        });
                      },
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: UniconsLine.trash_alt,
                        foregroundColor: whiteColor,
                        onTap: () async {
                          await controller.removeProduct(index);

                          setState(() {
                            controller.cartProducts.removeAt(index);
                          });
                        },
                      ),
                    ],
                    child: Container(
                      height: 104,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: lightColor)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 72,
                              width: 72,
                              child: Image.network(snapProduct.image)),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                CustomText(
                                  text: snapProduct.name,
                                  color: darkColor,
                                  alignment: Alignment.topLeft,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                Expanded(child: SizedBox()),
                                CustomText(
                                  text: snapProduct.price + " TND",
                                  color: primaryColor,
                                  alignment: Alignment.topLeft,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Icon(
                                    //   snapProduct.favourite == 1
                                    //       ? Icons.favorite
                                    //       : UniconsLine.heart_alt,
                                    //   color: snapProduct.favourite == 1
                                    //       ? primaryRed
                                    //       : greyColor,
                                    //   size: 24,
                                    // ),

                                    Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: Border.all(
                                                width: 0.0, color: whiteColor),
                                            color: HexColor.fromHex(
                                                snapProduct.color)),
                                        child: Center(
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                                color: whiteColor),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: darkColor),
                                      ),
                                      child: CustomText(
                                        text: snapProduct.size,
                                        color: darkColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Container(
                                  width: 104,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(color: lightColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller
                                            .decreaseProductQte(index),
                                        child: Icon(
                                          UniconsLine.minus,
                                          color: greyColor,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        color: lightColor,
                                        child: CustomText(
                                          text: snapProduct.quantity.toString(),
                                          color: greyColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () => controller
                                            .increaseProductQte(index),
                                        child: Icon(
                                          UniconsLine.plus,
                                          color: greyColor,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
