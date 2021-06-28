import 'package:ebuy/constants.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String label;
  final String link;

  final Function linkNavigation;

  CustomHeader({this.label = "", this.link = "See More", this.linkNavigation});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: label,
          fontSize: 14,
          color: darkColor,
          fontWeight: FontWeight.bold,
          alignment: Alignment.centerLeft,
        ),
        CustomText(
          text: link,
          color: primaryBlue,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
