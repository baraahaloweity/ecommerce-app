import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/view/widget/auth/customtextbody.dart';

import 'package:final_ecommerce/view/widget/auth/customtexttitle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/verificationcode_controller.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerificationCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          centerTitle: true,
          title: const Text("Verification Code"),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.grey),
        ),
        body: GetBuilder<VerificationCodeControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: ListView(
                  children: [
                    const CustomTextTitle(
                      text: "Chack Code",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomTextBody(
                      bodyText: "The code has been sent to your email",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    OtpTextField(
                      fieldWidth: 50.0,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.gotoresetpassword(verificationCode);
                      }, // end onSubmit
                    ),
                  ],
                )),
          ),
        ));
  }
}
