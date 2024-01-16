import 'package:final_ecommerce/controller/test_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context, index) => Text("${controller.data}")),
          ),
        );
      }),
    );
  }
}
