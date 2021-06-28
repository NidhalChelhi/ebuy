import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'custom_text.dart';
import 'package:ebuy/constants.dart';

class CustomListTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final String text;

  CustomListTile({
    @required this.label,
    @required this.text,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: primaryBlue,
          ),
          SizedBox(width: 16),
          CustomText(
              text: label,
              color: darkColor,
              fontSize: 12,
              fontWeight: FontWeight.bold),
          Expanded(child: SizedBox()),
          CustomText(
            text: text,
            color: greyColor,
            fontSize: 12,
          ),
          SizedBox(width: 12),
          Icon(
            UniconsLine.angle_right_b,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
