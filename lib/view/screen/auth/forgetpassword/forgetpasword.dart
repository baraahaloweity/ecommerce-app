import 'package:final_ecommerce/controller/auth_controller/forgetpassword_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/view/widget/auth/customtextbody.dart';

import 'package:final_ecommerce/view/widget/auth/customtexttitle.dart';
import 'package:final_ecommerce/view/widget/auth/cystombuttonauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/valid.dart';
import '../../../widget/auth/customtextfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          centerTitle: true,
          title: const Text("Forget Password"),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.grey),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const CustomTextTitle(
                        text: "Enter Email",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomTextBody(
                        bodyText:
                            "Enter your email to proceed to changing your password",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return ValidInput(val!, 5, 100, "email");
                        },
                        isNumber: false,
                        hintText: "Enter Your Email",
                        labelText: "Email",
                        iconData: Icons.email_outlined,
                        myController: controller.email,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButtomAuth(
                          text: "Chack",
                          onPressed: () {
                            controller.gotoverificationcode();
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
