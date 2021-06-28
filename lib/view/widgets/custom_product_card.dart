import 'package:ebuy/constants.dart';
import 'package:ebuy/model/product_model.dart';
import 'package:ebuy/view/widgets/custom_rating_bar.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel productModel;
  final double width;
  final double height;

  CustomProductCard({this.productModel, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.5),
          border: Border.all(color: lightColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Image.network(
              productModel.images[0],
              // height: height,
              // width: width,
            ),
          ),
          CustomText(
            text: productModel.name,
            fontSize: 12,
            color: darkColor,
            fontWeight: FontWeight.bold,
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(height: 8),
          CustomRatingBar(
            size: 12,
            rate: productModel.rating.toDouble(),
            padding: 1,
          ),
          SizedBox(height: 18),
          CustomText(
            text: "\$" + productModel.price,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: primaryBlue,
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
