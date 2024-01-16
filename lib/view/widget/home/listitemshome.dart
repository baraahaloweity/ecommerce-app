import 'package:final_ecommerce/controller/home_page_controller.dart';
import 'package:final_ecommerce/data/model/items_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerImp> {
  const Items({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 110,
            width: 150,
            padding: const EdgeInsets.symmetric(vertical: 3),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Opacity(
                opacity: 0.5,
                child: Image.network(
                  "${AppLinkApi.imagestatic}/${itemsModel.itemsImage}",
                  height: 110,
                  width: 150,
                  fit: BoxFit.fill,
                  //   color: Colors.transparent,
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: AppColors.black.withOpacity(0.3),
          //       borderRadius: BorderRadius.circular(20)),
          //   height: 115,
          //   width: 156,
          // ),
          Positioned(
              left: 13,
              child: Text(
                "${itemsModel.itemsName}",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
