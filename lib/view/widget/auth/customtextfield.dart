import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.obscuretext,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.onTapicon,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscuretext;
  final void Function()? onTapicon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: valid,
        controller: myController,
        keyboardType:
            isNumber == true ? TextInputType.number : TextInputType.text,
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(labelText)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(onTap: onTapicon, child: Icon(iconData)),
        ),
      ),
    );
  }
}
