import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

customInputDecoration(
    {required double size,
    required String hinttext,
    required IconData icon,
    required VoidCallback onTap}) {
  return InputDecoration(
    suffixIcon: GestureDetector(
      onTap: onTap,
      child: Icon(icon),
    ),
    hintText: hinttext,
    hintStyle: mainFont(
        fontsize: size * .03,
        fontweight: FontWeight.w500,
        color: AppColors.greyColor),
    contentPadding: EdgeInsets.all(15),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyColor),
      borderRadius: BorderRadius.circular(9),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(
        color: AppColors.greyColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(
        color: AppColors.greenColor,
      ),
    ),
  );
}


