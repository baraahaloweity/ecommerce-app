import 'package:final_ecommerce/controller/home_page_controller.dart';
import 'package:final_ecommerce/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolors.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              i: index,
            );
          }),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  const Categories({super.key, required this.categoriesModel, required this.i});
  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 70, // Specify a width
            height: 70,
            child: SvgPicture.network(
              "${AppLinkApi.imagestatic}/${categoriesModel.categoriesImage}",
              color: AppColors.secoundColor,
            ),
          ),
          Text(
            "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColors.black),
          )
        ],
      ),
    );
  }
}
