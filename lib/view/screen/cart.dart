import 'package:final_ecommerce/controller/mycart_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:final_ecommerce/view/widget/cart/bottomcart.dart';

import 'package:final_ecommerce/view/widget/cart/customcard_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/topcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    MyCartController controller = Get.put(MyCartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("MyCart"),
        ),
        bottomNavigationBar: GetBuilder<MyCartController>(
          builder: (controller) => BottomCart(
            price: "${controller.totalprice}\$",
            discount: "${controller.discountcoupon}",
            shipping: "2000",
            totalprice: "${controller.priceaftercoupon()}",
            myController: controller.coupon!,
            onpressedcoupon: () {
              controller.couponcode();
            },
          ),
        ),
        body: GetBuilder<MyCartController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  TopCart(
                    massage:
                        "you have a ${controller.totalcount} items in your cart",
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ...List.generate(
                          controller.mycart.length,
                          (index) => CustomCardCart(
                            count: "${controller.mycart[index].countitems!}",
                            name: '${controller.mycart[index].itemsName!}',
                            price: '${controller.mycart[index].itemspice!}\$',
                            imagecart: "${controller.mycart[index].itemsImage}",
                            onpressedadd: () async {
                              await controller
                                  .addCart(controller.mycart[index].itemsId!);
                              controller.refreshdata();
                            },
                            onpresseddelete: () async {
                              await controller.deleteCart(
                                  controller.mycart[index].itemsId!);
                              controller.refreshdata();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              )),
        ));
  }
}
