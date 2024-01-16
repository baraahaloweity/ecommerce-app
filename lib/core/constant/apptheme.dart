import 'package:final_ecommerce/core/constant/appcolors.dart';
import 'package:flutter/material.dart';

ThemeData themeDataEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  appBarTheme: AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColor),
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: AppColors.grey, height: 2, fontSize: 17),
  ),
);
ThemeData themeDataArabic = ThemeData(
  fontFamily: "Cairo",
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: AppColors.grey, height: 2, fontSize: 17),
  ),
);
