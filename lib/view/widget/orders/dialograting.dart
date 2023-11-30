import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/orders/archive_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      showCloseButton: true,
      submitButtonTextStyle: const TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 24),
      // your app's name?
      title: const Text(
        'Rating Order',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: AppColor.white,
        ),
      ),
      // your app's logo?
      image: Image.asset("assets/images/quality.jpg",
          height: 240, fit: BoxFit.cover),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment',
      onCancelled: () => log('cancelled'),
      onSubmitted: (response) {
        OrdersArchiveController controller = Get.find();
        controller.submitRating(orderId, response.rating, response.comment);
        log('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          // _rateAndReviewApp();
        }
      },
    ),
  );
}
