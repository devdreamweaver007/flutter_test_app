import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';

void showPopupDialog(BuildContext context, Widget widget, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final size = MediaQuery.of(context).size.width;
      return AlertDialog(
        title: Center(child: Text(title,style: mainFont(fontsize: size*.05, fontweight: FontWeight.w600, color: AppColors.blackColor),)),
        content: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(child: Column(
            children: [
              widget
            ],
          ))
        ),
        actions: [
        GestureDetector(
          onTap:()=> Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
            color: AppColors.greenColor
            ),
            child: Text("cancel",style: normalFont(fontsize:MediaQuery.of(context).size.width*.04 , fontweight: FontWeight.w400, color: AppColors.whiteColor),),
          ),
        )
        ],
      );
    },
  );
}
