import 'package:final_ecommerce/binding.dart';
import 'package:final_ecommerce/core/localization/changelocal.dart';
import 'package:final_ecommerce/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/translate.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServeces();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ChangeLocal controller = Get.put(ChangeLocal());
    return GetMaterialApp(
      translations: MyTranslate(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appthemeData,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
