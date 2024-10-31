import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';

void showPopupDialog(BuildContext context, Widget widget, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Container(
          width: double.maxFinite, // Ensure the dialog width is maximized
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
            child: Text("cancel"),
          ),
        )
        ],
      );
    },
  );
}
