import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/details_controller.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("order Details"),
        ),
        body: GetBuilder<DetailsControllerImp>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.all(5),
                  child: ListView(children: [
                    Table(
                      children: [
                        TableRow(children: [
                          Text(
                            "item",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "QTY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "price",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        ...List.generate(
                            controller.data.length,
                            (index) => TableRow(children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemspice}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "total price: ${controller.orderModel.ordersTotalPrice} \$",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (controller.orderModel.ordersType == "0")
                      Card(
                        child: ListTile(
                          title: Text(
                            "Shipping Address",
                            style: TextStyle(
                                color: AppColors.secoundColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "${controller.orderModel.addressName} ${controller.orderModel.addressStreet}"),
                        ),
                      )
                  ]),
                ),
              )),
        ));
  }
}
