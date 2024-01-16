import 'package:final_ecommerce/core/middleware/mymiddleware.dart';
import 'package:final_ecommerce/view/screen/address/add_address.dart';
import 'package:final_ecommerce/view/screen/address/view_address.dart';

import 'package:final_ecommerce/view/screen/auth/forgetpassword/forgetpasword.dart';
import 'package:final_ecommerce/view/screen/auth/login.dart';
import 'package:final_ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:final_ecommerce/view/screen/auth/signup.dart';
import 'package:final_ecommerce/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:final_ecommerce/view/screen/auth/success_signup.dart';
import 'package:final_ecommerce/view/screen/auth/forgetpassword/verificationcode.dart';
import 'package:final_ecommerce/view/screen/auth/verificationcodesignup.dart';
import 'package:final_ecommerce/view/screen/cart.dart';
import 'package:final_ecommerce/view/screen/checkout.dart';

import 'package:final_ecommerce/view/screen/homescreen.dart';
import 'package:final_ecommerce/view/screen/itemdetails.dart';
import 'package:final_ecommerce/view/screen/items.dart';
import 'package:final_ecommerce/view/screen/language.dart';
import 'package:final_ecommerce/view/screen/myfavorite.dart';
import 'package:final_ecommerce/view/screen/onboarding.dart';
import 'package:final_ecommerce/view/screen/orders/archiveorder.dart';
import 'package:final_ecommerce/view/screen/orders/detailsorder.dart';
import 'package:final_ecommerce/view/screen/orders/pending.dart';

import 'package:get/get.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleware(),
  ]),
  // GetPage(name: "/", page: () => const OnBoarding()),
  /////////////////////////////auth
  GetPage(name: Approutes.login, page: () => Login()),
  GetPage(name: Approutes.signup, page: () => const SignUp()),
  GetPage(name: Approutes.forgetpassword, page: () => const ForgetPassword()),
  GetPage(
      name: Approutes.verificationcode, page: () => const VerificationCode()),
  GetPage(
      name: Approutes.verificationcodesignup,
      page: () => const VerificationCodeSignUp()),
  GetPage(name: Approutes.resetpassword, page: () => const ResetPassword()),
  GetPage(
      name: Approutes.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: Approutes.successSignup, page: () => const SuccessSignup()),
  //
  GetPage(name: Approutes.onboarding, page: () => const OnBoarding()),
  ////////////
  GetPage(name: Approutes.homepage, page: () => const HomeScreen()),

  GetPage(name: Approutes.items, page: () => const Item()),
  GetPage(name: Approutes.itemdetails, page: () => const ItemDetails()),
  GetPage(name: Approutes.myfavorite, page: () => const MyFavorite()),
  GetPage(name: Approutes.cart, page: () => const Cart()),

  //////////////address
  GetPage(name: Approutes.view_address, page: () => const ViewAddress()),
  GetPage(name: Approutes.add_address, page: () => const AddAddress()),

  ////////checkout
  GetPage(name: Approutes.checkout, page: () => const CheckOut()),
  GetPage(name: Approutes.pending, page: () => const Pending()),
  GetPage(name: Approutes.details, page: () => const DetailsOrder()),
  GetPage(name: Approutes.archiveorder, page: () => const ArchiveOrder()),
];
