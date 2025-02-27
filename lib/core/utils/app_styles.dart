import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle regular12Text = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.primaryColor);

  static TextStyle regular11SalePrice = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.primaryColor);

  static TextStyle regular14Text = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryDark);

  static TextStyle regular18White = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.whiteColor);

  static TextStyle light14SearchHint = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.searchHintColor);

  static TextStyle light16White = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, color: AppColors.whiteColor);

  static TextStyle light18HintText = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: AppColors.hintTextColor);

  static TextStyle semi16TextWhite = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.whiteColor);

  static TextStyle semi20Primary = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor);

  static TextStyle semi24White = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.whiteColor);

  static TextStyle medium14Category = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primaryDark);

  static TextStyle medium14LightPrimary = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primaryDarkLight);


      static TextStyle medium18White = GoogleFonts.poppins(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.whiteColor);


      
    static TextStyle medium18Primary = GoogleFonts.poppins(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor);
}
