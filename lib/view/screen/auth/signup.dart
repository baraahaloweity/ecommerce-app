import 'package:final_ecommerce/controller/auth_controller/signup_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/core/functions/valid.dart';
import 'package:final_ecommerce/view/widget/auth/customtextbody.dart';
import 'package:final_ecommerce/view/widget/auth/customtextsignup.dart';
import 'package:final_ecommerce/view/widget/auth/customtexttitle.dart';
import 'package:final_ecommerce/view/widget/auth/cystombuttonauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alert.dart';
import '../../widget/auth/customtextfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          centerTitle: true,
          title: const Text("Sign Up"),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.grey),
        ),
        body: WillPopScope(
          onWillPop: alerExitApp,
          child: GetBuilder<SignUpControllerImp>(
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
                                text: "Welcome Back",
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const CustomTextBody(
                                bodyText:
                                    "Sign Up with your email and password or continue with socail media",
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                valid: (val) {
                                  return ValidInput(val!, 3, 9, "name");
                                },
                                isNumber: false,
                                hintText: "Enter Your Name",
                                labelText: "Name",
                                iconData: Icons.person_outlined,
                                myController: controller.name,
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
                              CustomTextField(
                                valid: (val) {
                                  return ValidInput(val!, 9, 100, "phone");
                                },
                                isNumber: true,
                                hintText: "Enter Your Phone",
                                labelText: "Phone",
                                iconData: Icons.phone_android_outlined,
                                myController: controller.phone,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<SignUpControllerImp>(
                                builder: (controller) => CustomTextField(
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
                              ),
                              CustomButtomAuth(
                                  text: "Sign Up",
                                  onPressed: () {
                                    controller.Signup();
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextSignup(
                                textone: " have an account ? ",
                                texttwo: "Sign in",
                                ontap: () {
                                  controller.toLogin();
                                },
                              ),
                            ],
                          ),
                        )),
                  )),
        ));
  }
}
