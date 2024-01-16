import 'package:final_ecommerce/controller/mycart_controller.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomCart extends GetView<MyCartController> {
  const BottomCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      required this.myController,
      required this.onpressedcoupon,
      required this.discount});
  final String price;
  final String shipping;
  final String discount;
  final String totalprice;
  final TextEditingController myController;
  final void Function()? onpressedcoupon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<MyCartController>(
              builder: ((controller) => controller.nameCoupon == null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText: "enter coupon",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  border: OutlineInputBorder())),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            flex: 1,
                            child: ButtonCart(
                              textlanguage: "coupon",
                              onPressed: onpressedcoupon,
                            ))
                      ],
                    )
                  : Container(
                      child: Text("coupon name : ${controller.nameCoupon}"),
                    ))),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("price"),
                    Text(price),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("discount"),
                    Text(discount),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shopping"),
                    Text(shipping),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total price"),
                    Text(totalprice),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonCart(
            textlanguage: "order",
            onPressed: () {
              controller.gotocheckout();
            },
          ),
        ],
      ),
    );
  }
}
