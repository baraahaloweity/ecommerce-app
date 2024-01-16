import 'package:final_ecommerce/controller/auth_controller/successsignup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../widget/auth/cystombuttonauth.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundcolor,
        centerTitle: true,
        title: const Text("Success SignUp"),
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
            Text("successfully registered"),
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
