import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/colors.dart';

class Apptheme {
  static final ThemeData lightTheme = ThemeData(
      dialogTheme: DialogTheme(backgroundColor: AppColors.primaryColor),
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0));
}
