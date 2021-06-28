import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onSaved;
  final Function validator;
  final bool obscure;
  final TextInputType type;

  CustomTextFormField(
      {this.hint = "",
      this.icon,
      this.onSaved,
      this.validator,
      this.obscure = false,
      this.type = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: type,
        autofocus: false,
        style: TextStyle(
            color: greyColor, fontWeight: FontWeight.bold, fontSize: 12),
        obscureText: obscure,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryBlue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightColor, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryRed, width: 1.0),
            ),
            hintText: hint,
            hintStyle: TextStyle(
                color: greyColor, fontWeight: FontWeight.normal, fontSize: 12),
            fillColor: whiteColor,
            prefixIcon: Icon(
              icon,
              size: 24,
            )),
      ),
    );
  }
}
