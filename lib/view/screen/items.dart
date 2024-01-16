import 'package:final_ecommerce/controller/items_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:final_ecommerce/view/screen/home_page.dart';

import 'package:final_ecommerce/view/widget/home/customappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
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
          SizedBox(
            height: 20,
          ),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          itemCount: controller.data.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (BuildContext context, index) {
                            controllerfav.isFavorite[controller.data[index]
                                    ["items_id"]] =
                                controller.data[index]["favorite"];
                            return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]),
                            );
                          })
                      : SearchItems(itemsSearch: controller.itemssearch))))
        ]),
      ),
    );
  }
}
