import 'package:ebuy/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  CustomText(
      {this.text = "",
      this.fontSize = 16,
      this.color = darkColor,
      this.alignment = Alignment.center,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle),
      ),
    );
  }
}

class CustomParagraph extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  CustomParagraph(
      {this.text = "",
      this.fontSize = 16,
      this.color = darkColor,
      this.alignment = Alignment.center,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            height: 1.8),
      ),
    );
  }
}
