import 'package:final_ecommerce/controller/home_page_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/model/items_model.dart';
import 'package:final_ecommerce/linkapi.dart';

import 'package:final_ecommerce/view/widget/home/customappbarhome.dart';
import 'package:final_ecommerce/view/widget/home/customcardhome.dart';
import 'package:final_ecommerce/view/widget/home/customtitlehome.dart';
import 'package:final_ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:final_ecommerce/view/widget/home/listitemshome.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
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
          GetBuilder<HomePageControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCardHome(
                                title: "${controller.hometitle}",
                                body: "${controller.homebody}"),
                            CustomTitleHome(title: "categories"),
                            ListCategoriesHome(),
                            CustomTitleHome(title: "top selling"),
                            ListItemsHome(),
                          ],
                        )
                      : SearchItems(itemsSearch: controller.itemssearch))),
        ],
      ),
    );
  }
}

class SearchItems extends GetView<HomePageControllerImp> {
  const SearchItems({super.key, required this.itemsSearch});
  final List<ItemsModel> itemsSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemsSearch.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.goToItemDetails(itemsSearch[index]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(
                            "${AppLinkApi.imagestatic}/${itemsSearch[index].itemsImage}",
                            fit: BoxFit.fill,
                          )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text("${itemsSearch[index].itemsName}"),
                            subtitle:
                                Text("${itemsSearch[index].categoriesName}"),
                          )),
                    ]),
                  ),
                ),
              ),
            ));
  }
}
