import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/view/widget/auth/customtextbody.dart';

import 'package:final_ecommerce/view/widget/auth/customtexttitle.dart';
import 'package:final_ecommerce/view/widget/auth/cystombuttonauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/resetpassword_controller.dart';
import '../../../../core/functions/valid.dart';
import '../../../widget/auth/customtextfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    //ResetPasswordControllerImp controller =
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          centerTitle: true,
          title: const Text("Reset Password"),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.grey),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => HandlingDataViewRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const CustomTextTitle(
                          text: "Reset Password",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextBody(
                          bodyText:
                              "Reset your password to log in to your account",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          valid: (val) {
                            return ValidInput(val!, 5, 100, "password");
                          },
                          isNumber: true,
                          onTapicon: () {
                            controller.showPassword();
                          },
                          obscuretext: controller.isShowPassword,
                          hintText: "Enter Your password",
                          labelText: "Password",
                          iconData: Icons.lock_outlined,
                          myController: controller.password,
                        ),
                        CustomTextField(
                          valid: (val) {
                            return ValidInput(val!, 5, 100, "Re_password");
                          },
                          isNumber: true,
                          onTapicon: () {
                            controller.showPassword();
                          },
                          obscuretext: controller.isShowPassword,
                          hintText: "Enter Your Re_password",
                          labelText: "Re_Password",
                          iconData: Icons.lock_outlined,
                          myController: controller.rePassword,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButtomAuth(
                            text: "Save",
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
