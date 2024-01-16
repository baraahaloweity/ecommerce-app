import 'package:final_ecommerce/core/constant/appimageasset.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logoimage,
      height: 180,
      width: 180,
    );
  }
}
