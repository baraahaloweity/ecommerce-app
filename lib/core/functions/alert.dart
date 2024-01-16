import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alerExitApp() {
  Get.defaultDialog(
      title: "alert",
      middleText: "Do you want to Exit?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("yes")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel")),
      ]);
  return Future.value(true);
}
