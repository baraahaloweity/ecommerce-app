import 'package:final_ecommerce/controller/orders/pending_controller.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../data/model/pending_model.dart';

class CardOrdersList extends GetView<PendingControllerImp> {
  const CardOrdersList(
      {super.key,
      required this.type,
      required this.price,
      required this.deliveryPrice,
      required this.payment,
      required this.total,
      required this.numberorder,
      required this.pendingModel,
      required this.status,
      this.onpresseddel});
  final String type;
  final String price;
  final String deliveryPrice;
  final String payment;
  final String total;
  final String numberorder;
  final String status;
  final PendingModel pendingModel;
  final void Function()? onpresseddel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "order number: ${numberorder}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Text("order Type: ${type}"),
          Text("order price: ${price}"),
          Text("delivery price: ${deliveryPrice}"),
          Text("payment method: ${payment}"),
          Text("order status: ${status}"),
          Divider(),
          Row(
            children: [
              Text(" total price: ${total}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor)),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(Approutes.details,
                      arguments: {"order_details": pendingModel});
                },
                child: Text("detils",
                    style: TextStyle(color: AppColors.primaryColor)),
                color: AppColors.thirdColor,
              ),
              SizedBox(
                width: 10,
              ),
              if (pendingModel.ordersStatus! == "0")
                MaterialButton(
                  onPressed: onpresseddel,
                  child: Text("delete",
                      style: TextStyle(color: AppColors.primaryColor)),
                  color: AppColors.thirdColor,
                )
            ],
          ),
        ]),
      ),
    );
  }
}
