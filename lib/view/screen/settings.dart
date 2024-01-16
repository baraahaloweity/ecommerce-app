import 'package:final_ecommerce/controller/settings_controller.dart';
import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:final_ecommerce/core/constant/appimageasset.dart';
import 'package:final_ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 3,
              color: AppColors.primaryColor,
            ),
            Positioned(
                top: Get.width / 4,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.grey,
                      backgroundImage: AssetImage(AppImageAsset.person),
                    ))),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Card(
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ListTile(
                //   trailing: Switch(value: true, onChanged: (Val) {}),
                //   title: Text("notification disable"),
                // ),
                // Divider(),
                ListTile(
                  trailing: const Icon(Icons.pending),
                  title: const Text("pending orders"),
                  onTap: () {
                    Get.toNamed(Approutes.pending);
                  },
                ),
                const Divider(),
                ListTile(
                  trailing: const Icon(Icons.archive_outlined),
                  title: const Text("archive orders"),
                  onTap: () {
                    Get.toNamed(Approutes.archiveorder);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                  onTap: () {
                    Get.toNamed(Approutes.view_address);
                  },
                ),
                // Divider(),
                // ListTile(
                //   title: Text("about us"),
                //   trailing: Icon(Icons.help_outline_outlined),
                //   onTap: () {},
                // ),
                const Divider(),
                ListTile(
                  title: const Text("contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                  onTap: () {
                    launchUrl(Uri.parse("tel:+0957854246"));
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("logout"),
                  trailing: const Icon(Icons.logout_outlined),
                  onTap: () {
                    controller.logout();
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
