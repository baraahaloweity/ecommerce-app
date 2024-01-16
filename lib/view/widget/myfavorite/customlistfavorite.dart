import 'package:final_ecommerce/data/model/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/myfavorite_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class CustomListFavorite extends GetView<MyFavoriteControllerImp> {
  const CustomListFavorite({super.key, required this.myFavoriteModel});
  final MyFavoriteModel myFavoriteModel;

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return InkWell(
      onTap: () {
        //controller.goToItemDetails(myFavoriteModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${myFavoriteModel.itemsId}",
                  child: Image.network(
                    AppLinkApi.imagestatic + "/" + myFavoriteModel.itemsImage!,
                    height: 110,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "${translateDataBase(myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName)}",
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review",
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${myFavoriteModel.itemsPrice}\$",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<MyFavoriteControllerImp>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              controller
                                  .deletefromFav(myFavoriteModel.favoriteId!);
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: AppColors.primaryColor,
                            )))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
