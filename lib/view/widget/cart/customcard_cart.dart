import 'package:flutter/material.dart';

import '../../../core/constant/appcolors.dart';

import '../../../linkapi.dart';

class CustomCardCart extends StatelessWidget {
  const CustomCardCart(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagecart,
      required this.onpresseddelete,
      required this.onpressedadd});
  final String name;
  final String price;
  final String count;
  final String imagecart;
  final void Function()? onpresseddelete;
  final void Function()? onpressedadd;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              AppLinkApi.imagestatic + "/" + imagecart,
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              subtitle: Text(price,
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 18)),
            ),
          ),
          Expanded(
            child: Column(children: [
              Container(
                height: 35,
                child: IconButton(
                  onPressed: onpressedadd,
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Text(
                  count,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 35,
                child: IconButton(
                  onPressed: onpresseddelete,
                  icon: Icon(Icons.remove, size: 30),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
