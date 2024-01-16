import 'package:final_ecommerce/controller/addressview_controller.dart';
import 'package:final_ecommerce/core/class/handlingdataview.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:final_ecommerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewControllerImp());
    return Scaffold(
        appBar: AppBar(title: Text("address")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Approutes.add_address);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return AddressCard(
                      addressModel: controller.data[index],
                      onDelete: () {
                        controller
                            .deleteaddress(controller.data[index].addressId!);
                      },
                    );
                  })),
        ));
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.addressModel, this.onDelete});
  final AddressModel addressModel;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(
        "${addressModel.addressName}",
      ),
      subtitle:
          Text("${addressModel.addressCity}   ${addressModel.addressStreet}"),
      trailing: IconButton(
        onPressed: onDelete,
        icon: Icon(Icons.delete_outline),
      ),
    ));
  }
}
