import 'package:final_ecommerce/controller/myfavorite_controller.dart';
import 'package:final_ecommerce/view/screen/home_page.dart';
import 'package:final_ecommerce/view/widget/myfavorite/customlistfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/routes.dart';

import '../widget/home/customappbarhome.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteControllerImp controller = Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(children: [
          CustomAppbarHome(
            onChanged: (val) {
              controller.checksearch(val);
            },
            mysearch: controller.search!,
            title: "Find Product",
            onpressedsearch: () {
              controller.onsearch();
            },
            onpressedfav: () {
              Get.toNamed(Approutes.myfavorite);
            },
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8, top: 8),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "My Favorite",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GetBuilder<MyFavoriteControllerImp>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          itemCount: controller.myfavorite.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (BuildContext context, index) {
                            return CustomListFavorite(
                              myFavoriteModel: controller.myfavorite[index],
                            );
                          })
                      : SearchItems(itemsSearch: controller.itemssearch))))
        ]),
      ),
    );
  }
}
