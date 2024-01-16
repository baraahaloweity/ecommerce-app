import 'package:final_ecommerce/controller/auth_controller/successresetpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/appcolors.dart';
import '../../../widget/auth/cystombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        centerTitle: true,
        title: const Text("Success Reset Password"),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Colors.grey),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.primaryColor,
              size: 200,
            ),
            Text("congratulations",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 30)),
            Text("successfully Reset Password"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToLogin();
                    // controller.signUp();
                  }),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
