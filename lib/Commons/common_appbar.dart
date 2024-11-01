import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

commonAppbar({required String text, required double size,required bool isNormal}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.whiteColor,
    title:
    isNormal?
     Center(
      child: Text(
        text,
        style: mainFont(
            fontsize: size * .05,
            fontweight: FontWeight.bold,
            color: AppColors.blackColor),
      ),
    ):Text(
        text,
        style: mainFont(
            fontsize: size * .05,
            fontweight: FontWeight.bold,
            color: AppColors.blackColor),
      ),
  );
}
