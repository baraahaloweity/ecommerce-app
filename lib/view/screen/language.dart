import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/core/localization/changelocal.dart';
import 'package:final_ecommerce/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<ChangeLocal> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonLanguage(
                textlanguage: "ar",
                onPressed: () {
                  controller.changelang("ar");
                  Get.offNamed(Approutes.onboarding);
                },
              ),
              CustomButtonLanguage(
                textlanguage: "en",
                onPressed: () {
                  controller.changelang("en");
                  Get.offNamed(Approutes.onboarding);
                },
              ),
            ],
          )),
    );
  }
}
