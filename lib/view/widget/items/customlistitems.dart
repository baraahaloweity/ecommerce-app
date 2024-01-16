import 'package:final_ecommerce/controller/favorite_controller.dart';
import 'package:final_ecommerce/controller/items_controller.dart';

import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: Image.network(
                        AppLinkApi.imagestatic + "/" + itemsModel.itemsImage!,
                        height: 130,
                        width: 200,
                        fit: BoxFit.fill,
                        // color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.timer_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${controller.deliverydate} muments",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${itemsModel.itemsPriceDiscount}",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsModel.itemsId] ==
                                        "1") {
                                      controller.favorite(
                                          itemsModel.itemsId, "0");
                                      controller
                                          .delFavorite(itemsModel.itemsId!);
                                    } else {
                                      controller.favorite(
                                          itemsModel.itemsId, "1");
                                      controller
                                          .addFavorite(itemsModel.itemsId!);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] ==
                                            "1"
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: AppColors.primaryColor,
                                  )))
                        ],
                      ),
                    )
                  ]),
            ),
            if (itemsModel.itemsDiscount != "0")
              Image.network(
                AppLinkApi.imagestatic + "/sale.png",
                height: 50,
                width: 50,
              ),
          ],
        ),
      ),
    );
  }
}
