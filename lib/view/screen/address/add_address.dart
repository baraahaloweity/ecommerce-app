import 'package:final_ecommerce/core/class/handlingdataview.dart';

import 'package:final_ecommerce/view/widget/auth/cystombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/addaddress_controller.dart';
import '../../widget/auth/customtextfield.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressControllerImp());
    return Scaffold(
        appBar: AppBar(title: Text("add address")),
        body: GetBuilder<AddAddressControllerImp>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return null;
                        },
                        isNumber: false,
                        hintText: "Enter Name address",
                        labelText: "Name",
                        iconData: Icons.location_on,
                        myController: controller.name,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return null;
                        },
                        isNumber: false,
                        hintText: "Enter Your city",
                        labelText: "city",
                        iconData: Icons.location_city,
                        myController: controller.city,
                      ),
                      CustomTextField(
                        valid: (val) {
                          return null;
                        },
                        isNumber: false,
                        hintText: "Enter Your street",
                        labelText: "street",
                        iconData: Icons.location_searching_outlined,
                        myController: controller.street,
                      ),
                      CustomButtomAuth(
                        text: "add address",
                        onPressed: () {
                          controller.addAddress();
                        },
                      )
                    ],
                  ),
                )))));
  }
}
