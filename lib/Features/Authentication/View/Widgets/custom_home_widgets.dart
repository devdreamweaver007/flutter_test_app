import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

gapB(context, double size) {
  return SizedBox(
    height: size * .06,
  );
}

gapM(context, double size) {
  return SizedBox(
    height: size * .04,
  );
}

gaps(context, double size) {
  return SizedBox(
    height: size * .02,
  );
}

Widget customtext(String text, double size) {
    return Text(
      text,
      style: mainFont(
          fontsize: size * .03,
          fontweight: FontWeight.w400,
          color: AppColors.blackColor),
    );
  }
