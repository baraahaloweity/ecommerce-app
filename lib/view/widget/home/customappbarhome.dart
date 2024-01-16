import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome(
      {super.key,
      required this.title,
      this.onpressedsearch,
      required this.onpressedfav,
      required this.mysearch,
      required this.onChanged});
  final String title;
  final TextEditingController mysearch;
  final void Function()? onpressedsearch;
  final void Function()? onpressedfav;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: mysearch,
            onChanged: onChanged,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: onpressedsearch,
                ),
                hintText: title,
                hintStyle: TextStyle(fontSize: 18)),
          )),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 70,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
              onPressed: onpressedfav,
            ),
          )
        ],
      ),
    );
  }
}
