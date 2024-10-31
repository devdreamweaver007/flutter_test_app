import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

Widget termsAndConditions({
  required bool isChecked,
  required Function(bool?) onChanged,
  required double size,
}) {
  return Row(
    children: [
      Checkbox(
        activeColor: AppColors.greenColor,
        checkColor: AppColors.whiteColor,
        value: isChecked,
        onChanged: onChanged,
      ),
      Column(
        children: [
          SizedBox(
            width: size * .7,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: mainFont(fontsize: size*.03, fontweight: FontWeight.w100, color: AppColors.blackColor),
                children: [
                  TextSpan(
                    text:
                        "By creating or logging into an account you are agreeing with our ",
                  ),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " and ",
                  ),
                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
