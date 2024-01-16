import 'package:final_ecommerce/controller/orders/archive_controller.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRating(BuildContext context, String orderid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            submitButtonText: 'Submit',
            submitButtonTextStyle: TextStyle(color: AppColors.primaryColor),
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              ArchiveControllerImp controller = Get.find();
              controller.ratingorders(
                  orderid, response.comment, response.rating);
            },
          ));
}
