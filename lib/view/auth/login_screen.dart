import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/auth_view_model.dart';
import 'package:ebuy/view/widgets/custom_button.dart';
import 'package:ebuy/view/widgets/custom_button_social.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:ebuy/view/widgets/custom_text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo/BlueMaxLogo.png',
                  height: 72,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Welcome to E-Buy",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  color: darkColor,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Sign in to Continue",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  color: greyColor,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  hint: "Your Email",
                  icon: UniconsLine.envelope_alt,
                  type: TextInputType.emailAddress,
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) => EmailValidator.validate(value)
                      ? null
                      : "Please enter a valid email",
                ),
                SizedBox(height: 8),
                CustomTextFormField(
                  hint: "Password",
                  icon: UniconsLine.lock_alt,
                  type: TextInputType.visiblePassword,
                  obscure: true,
                  onSaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(height: 16),
                CustomButton(
                  label: "Sign In",
                  color: primaryBlue,
                  onPressed: () {
                    _formKey.currentState.save();

                    if (_formKey.currentState.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: lightColor,
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    CustomText(
                      text: "OR",
                      alignment: Alignment.topCenter,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: greyColor,
                    ),
                    Expanded(
                        child: Divider(
                      color: lightColor,
                      thickness: 1,
                      indent: 10,
                    )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButtonSocial(
                  label: 'Sign In with Facebook',
                  icon: UniconsLine.facebook_f,
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                  color: Color(0xff3b5998),
                ),
                SizedBox(height: 8),
                CustomButtonSocial(
                  label: 'Sign In with Google',
                  icon: UniconsLine.google,
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  color: Color(0xffDB4437),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Forget Password ?",
                  color: primaryBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don’t have a account? ",
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/register");
                      },
                      child: CustomText(
                        text: "Register",
                        color: primaryBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 84),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
