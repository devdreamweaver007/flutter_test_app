// ignore: depend_on_referenced_packages
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
showFlushbar({required context,required Color color,required IconData icon,required String message}){
  return Flushbar(
    backgroundColor: color,
    borderRadius: BorderRadius.circular(15),
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(left: 20,right: 20,bottom: 100),
  message: message,
  icon: Icon(
    icon,
    size: 28.0,
    color: AppColors.whiteColor,
    ),
  duration: Duration(seconds: 3),
)..show(context);
}

errorFlushbar(context,String message){
  return showFlushbar(context: context, color: AppColors.errorColor, icon: Icons.sentiment_dissatisfied, message: message);
}
successFlushbar(context,String message){
  return showFlushbar(context: context, color: AppColors.successColor, icon: Icons.sentiment_satisfied, message: message);
}

