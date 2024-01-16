import 'package:final_ecommerce/controller/orders/archive_controller.dart';

import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/view/widget/orders/rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../data/model/pending_model.dart';

class CardArchiveList extends GetView<ArchiveControllerImp> {
  const CardArchiveList({
    super.key,
    required this.type,
    required this.price,
    required this.deliveryPrice,
    required this.payment,
    required this.total,
    required this.numberorder,
    required this.pendingModel,
    required this.status,
  });
  final String type;
  final String price;
  final String deliveryPrice;
  final String payment;
  final String total;
  final String numberorder;
  final String status;
  final PendingModel pendingModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "order number: ${numberorder}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Text("order Type: ${type}"),
          Text("order price: ${price}"),
          Text("delivery price: ${deliveryPrice}"),
          Text("payment method: ${payment}"),
          Text("order status: ${status}"),
          const Divider(),
          Row(
            children: [
              Text(" total price: ${total}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor)),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(Approutes.details,
                      arguments: {"order_details": pendingModel});
                },
                child: const Text("detils",
                    style: TextStyle(color: AppColors.primaryColor)),
                color: AppColors.thirdColor,
              ),
              const SizedBox(
                width: 10,
              ),
              if (pendingModel.ordersRating == "0")
                MaterialButton(
                  onPressed: () {
                    showRating(context, pendingModel.ordersId!);
                  },
                  child: const Text("Rating",
                      style: TextStyle(color: AppColors.primaryColor)),
                  color: AppColors.thirdColor,
                ),
            ],
          ),
        ]),
      ),
    );
  }
}
