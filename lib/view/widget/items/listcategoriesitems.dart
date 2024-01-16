import 'package:final_ecommerce/controller/items_controller.dart';
import 'package:final_ecommerce/data/model/categories.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../core/functions/translatedatabase.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.put(ItemsControllerImp);
    return SizedBox(
      height: 70,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoriesItems(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              i: index,
            );
          }),
    );
  }
}

class CategoriesItems extends GetView<ItemsControllerImp> {
  const CategoriesItems(
      {super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeItem(i!, categoriesModel.categoriesId!);
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 8, color: AppColors.primaryColor)))
                  : null,
              child: Text(
                "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: const TextStyle(fontSize: 20, color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
