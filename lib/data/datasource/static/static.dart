import 'package:get/get.dart';

import '../../../core/constant/appimageasset.dart';
import '../../model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "2".tr, image: AppImageAsset.onBoardingimageOne, body: "3".tr),
  OnBoardingModel(
      title: "Eost & Sofe payment",
      image: AppImageAsset.onBoardingimageTwo,
      body:
          "Eosy checkout & safe payment \n method Trusted by our Customers \n from all over work"),
  OnBoardingModel(
      title: "Track Your Order",
      image: AppImageAsset.onBoardingimageThree,
      body:
          "Best Tracker has been used for \n track your order. you'll know where \n your product is at the moment"),
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     image: AppImageAsset.onBoardingimageFour,
  //     body:
  //         "Rellable And fast delivery. we \n delivery your product the fastast \n way passible"),
];
