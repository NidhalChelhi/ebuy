import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';
import 'package:ebuy/constants.dart';

class CustomButtonSocial extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Function onPressed;

  CustomButtonSocial({
    @required this.label,
    @required this.icon,
    @required this.color,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: greyColor),
      ),
      width: Get.width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            Expanded(child: SizedBox()),
            CustomText(
              text: label,
              color: greyColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              alignment: Alignment.center,
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
