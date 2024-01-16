import 'package:final_ecommerce/controller/checkout_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/core/constant/appimageasset.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/view/widget/checkout/buttoncheckout.dart';
import 'package:final_ecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:final_ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:final_ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:final_ecommerce/view/widget/checkout/questiontitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckOut"),
        ),
        bottomNavigationBar: ButtonCheckout(
          onpressedcheck: () {
            controller.checkout();
          },
          title: "Checkout",
        ),
        body: GetBuilder<CheckoutController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                    QuestionTitle(title: "Chose Payment Method"),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          controller.chosepaymentMethod("0");
                        },
                        child: CardPaymentMethod(
                            title: "Cash",
                            isactive: controller.paymentMethod == "0"
                                ? true
                                : false)),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        controller.chosepaymentMethod("1");
                      },
                      child: CardPaymentMethod(
                          title: "payment cards",
                          isactive:
                              controller.paymentMethod == "1" ? true : false),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionTitle(title: "Chose Delivery Type"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chosedeliveryType("0");
                            },
                            child: CardDeliveryType(
                                imagename: AppImageAsset.delivery,
                                title: "Delivery",
                                isactive: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              controller.chosedeliveryType("1");
                            },
                            child: CardDeliveryType(
                                imagename: AppImageAsset.drivethru,
                                title: "Delivery thru",
                                isactive: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (controller.deliveryType == "0")
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (controller.addressdata.isNotEmpty)
                            QuestionTitle(title: "Shipping Address"),
                          if (controller.addressdata.isEmpty)
                            InkWell(
                              onTap: () {
                                Get.toNamed(Approutes.add_address);
                              },
                              child: Text(
                                "please add address to recive orders \n click here to add",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            controller.addressdata.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.choseshippingAddress(
                                    "${controller.addressdata[index].addressId}");
                              },
                              child: CardShippingAddress(
                                  title:
                                      "${controller.addressdata[index].addressName}",
                                  subtitle:
                                      "${controller.addressdata[index].addressCity} ${controller.addressdata[index].addressStreet}",
                                  isactive: controller.shippingAddress ==
                                          controller
                                              .addressdata[index].addressId
                                      ? true
                                      : false),
                            ),
                          )
                        ],
                      )
                  ]),
                ),
              )),
        ));
  }
}
