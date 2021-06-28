import 'package:ebuy/constants.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color color;
  final Function onPressed;

  CustomButton(
      {this.label = "",
      this.color = primaryColor,
      this.textColor = whiteColor,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 30,
          offset: Offset(0.0, 10.0),
          spreadRadius: 0,
          color: primaryBlue.withOpacity(0.24),
        )
      ]),
      height: 57,
      width: Get.width,
      child: TextButton(
        onPressed: onPressed,
        child: CustomText(
          text: label,
          color: textColor,
          alignment: Alignment.center,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
