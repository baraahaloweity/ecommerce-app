import 'package:final_ecommerce/controller/auth_controller/login_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/view/widget/auth/customtextbody.dart';
import 'package:final_ecommerce/view/widget/auth/customtextsignup.dart';
import 'package:final_ecommerce/view/widget/auth/customtexttitle.dart';
import 'package:final_ecommerce/view/widget/auth/cystombuttonauth.dart';
import 'package:final_ecommerce/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alert.dart';
import '../../../core/functions/valid.dart';
import '../../widget/auth/customtextfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          centerTitle: true,
          title: const Text("Login"),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.grey),
        ),
        body: WillPopScope(
            onWillPop: alerExitApp,
            child: GetBuilder<LoginControllerImp>(
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
                          const Logo(),
                          const CustomTextTitle(
                            text: "Welcome Back",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomTextBody(
                            bodyText:
                                "Log in using your email and password to enter the online store",
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
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextField(
                              valid: (val) {
                                return ValidInput(val!, 5, 30, "password");
                              },
                              onTapicon: () {
                                controller.showPassword();
                              },
                              obscuretext: controller.isShowPassword,
                              isNumber: true,
                              hintText: "Enter Your password",
                              labelText: "Password",
                              iconData: Icons.lock_outlined,
                              myController: controller.password,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Approutes.forgetpassword);
                            },
                            child: const Text(
                              "Forget Password",
                              textAlign: TextAlign.end,
                            ),
                          ),
                          CustomButtomAuth(
                              text: "Sign in",
                              onPressed: () {
                                controller.Login();
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextSignup(
                            textone: "Don't have an account ? ",
                            texttwo: "Sign up",
                            ontap: () {
                              controller.toSignUp();
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            )));
  }
}
