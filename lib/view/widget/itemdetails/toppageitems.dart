import 'package:final_ecommerce/controller/itemdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';

class TopPageItems extends GetView<ItemDetailsControllerImp> {
  const TopPageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 194, 228, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: Image.network(
                AppLinkApi.imagestatic +
                    "/" +
                    controller.itemsModel.itemsImage!,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height /
                    2, // Set to screen height
                width: MediaQuery.of(context).size.width /
                    2, // Set to screen width
              ),
            ),
          ),
        ),
      ],
    );
  }
}
