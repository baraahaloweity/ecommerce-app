import 'package:final_ecommerce/controller/orders/archive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/cardarchivelist.dart';

class ArchiveOrder extends StatelessWidget {
  const ArchiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("archive"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<ArchiveControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardArchiveList(
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
                  ),
                ))),
          )),
    );
  }
}
