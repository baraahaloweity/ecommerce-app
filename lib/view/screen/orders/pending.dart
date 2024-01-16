import 'package:final_ecommerce/controller/orders/pending_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/orders/cardorderslist.dart';

class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("pending orders"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<PendingControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersList(
                    type: controller
                        .typeDeliveryorder(controller.data[index].ordersType!),
                    price: controller.data[index].ordersPrice!,
                    deliveryPrice: controller.data[index].ordersPricedelivery!,
                    payment: controller.paymentMethodorder(
                        controller.data[index].ordersPaymentmethod!),
                    total: controller.data[index].ordersTotalPrice!,
                    numberorder: controller.data[index].ordersId!,
                    pendingModel: controller.data[index],
                    status: controller
                        .statusorder(controller.data[index].ordersStatus!),
                    onpresseddel: () {
                      controller.deleteorders(controller.data[index].ordersId!);
                    },
                  ),
                ))),
          )),
    );
  }
}
