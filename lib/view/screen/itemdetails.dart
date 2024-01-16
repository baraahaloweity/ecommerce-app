import 'package:final_ecommerce/controller/itemdetails_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/core/constant/routes.dart';

import 'package:final_ecommerce/view/widget/itemdetails/colorsselected.dart';
import 'package:final_ecommerce/view/widget/itemdetails/priceandcount.dart';
import 'package:final_ecommerce/view/widget/itemdetails/toppageitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<ItemDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      height: 45,
                      color: AppColors.primaryColor,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Get.toNamed(Approutes.cart);
                        },
                        child: Text(
                          "go To Card",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                )),
        body: GetBuilder<ItemDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  TopPageItems(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          PriceAndCount(
                            count: "${controller.countitem}",
                            price:
                                "${controller.itemsModel.itemsPriceDiscount}",
                            onadd: () {
                              controller.add();
                            },
                            onremove: () {
                              controller.delete();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: AppColors.fourthColor,
                                      fontSize: 30)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      color: AppColors.fourthColor,
                                      fontSize: 30)),
                          const SizedBox(
                            height: 20,
                          ),
                          ColorsSelected(),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
