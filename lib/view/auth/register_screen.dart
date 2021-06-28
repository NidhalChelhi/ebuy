import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/auth_view_model.dart';
import 'package:ebuy/view/widgets/custom_button.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:ebuy/view/widgets/custom_text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
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
                  text: "Let's Get Started",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  color: darkColor,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Create a new account",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  color: greyColor,
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  hint: "Full Name",
                  icon: UniconsLine.user,
                  type: TextInputType.name,
                  onSaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                CustomTextFormField(
                  hint: "Password Again",
                  icon: UniconsLine.lock_alt,
                  type: TextInputType.emailAddress,
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
                  label: "Sign Up",
                  color: primaryBlue,
                  onPressed: () {
                    _formKey.currentState.save();

                    if (_formKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Have a account? ",
                      color: greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/login");
                      },
                      child: CustomText(
                        text: "Login",
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
