import 'package:ebuy/constants.dart';
import 'package:ebuy/core/viewmodel/profile_view_model.dart';
import 'package:ebuy/view/widgets/custom_list_tile.dart';
import 'package:ebuy/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: whiteColor,
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(60.0),
                      child: AppBar(
                        leading: null,
                        actions: [],
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(0.0),
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10.0, left: 18, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Profile",
                                  alignment: Alignment.topLeft,
                                  color: darkColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  onTap: () => controller.signOut(),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: "Log Out",
                                        color: greyColor,
                                        fontSize: 14,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        UniconsLine.signout,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1,
                          color: lightColor,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: controller.userModel == null
                                            ? AssetImage(
                                                "assets/images/image 50.png")
                                            : controller.userModel.avatar == ""
                                                ? AssetImage(
                                                    "assets/images/image 50.png")
                                                : NetworkImage(controller
                                                    .userModel.avatar)))),
                            SizedBox(width: 16),
                            CustomText(
                              text: controller.userModel == null
                                  ? "User Name"
                                  : controller.userModel.name,
                              color: darkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 46,
                        ),
                        CustomListTile(
                          label: "Gender",
                          text: "Male",
                          icon: UniconsLine.venus,
                        ),
                        CustomListTile(
                          label: "Birthday",
                          text: "27-05-2002",
                          icon: UniconsLine.calendar_alt,
                        ),
                        CustomListTile(
                          label: "Email",
                          text: controller.userModel == null
                              ? "User Email"
                              : controller.userModel.email,
                          icon: UniconsLine.envelope_alt,
                        ),
                        CustomListTile(
                          label: "Phone Number",
                          text: "(307) 555-0133",
                          icon: UniconsLine.mobile_android,
                        ),
                        CustomListTile(
                          label: "Change Password",
                          text: "•••••••••••••••••",
                          icon: UniconsLine.lock_alt,
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
