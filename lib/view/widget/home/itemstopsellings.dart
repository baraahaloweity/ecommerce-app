import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_page_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../data/model/topsellingitemsmodel.dart';
import '../../../linkapi.dart';

class ItemsTopSellings extends GetView<HomePageControllerImp> {
  const ItemsTopSellings({super.key, required this.itemsModel});
  final TopSellingItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLinkApi.imagestatic}/${itemsModel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${itemsModel.itemsName}",
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
