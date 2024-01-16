import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

class CardShippingAddress extends StatelessWidget {
  const CardShippingAddress(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactive});
  final String title;
  final String subtitle;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive == true ? AppColors.primaryColor : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isactive == true ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: isactive == true ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
