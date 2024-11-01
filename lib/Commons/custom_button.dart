import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

customButton(
    {required double size,
    required String text,
    required Color color,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: size,
      height: size * .12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: mainFont(
              fontsize: size * .04,
              fontweight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
      ),
    ),
  );
}
