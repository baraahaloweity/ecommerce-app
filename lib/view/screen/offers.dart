import 'package:final_ecommerce/controller/offers_controller.dart';
import 'package:final_ecommerce/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../widget/home/customappbarhome.dart';

import '../widget/offers/customlistitemsoffers.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersControllerImp controller = Get.put(OffersControllerImp());
    Get.put(FavoriteController());
    return Container(
      padding: const EdgeInsets.all(10),
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
          SizedBox(
            height: 10,
          ),
          GetBuilder<OffersControllerImp>(
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
                            return CustomListItemsOffers(
                              itemsModel: controller.data[index],
                            );
                          })
                      : SearchItems(itemsSearch: controller.itemssearch))))
        ],
      ),
    );
  }
}
