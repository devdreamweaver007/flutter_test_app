import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';

customFloatButton(VoidCallback ontap){
  return  Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: ontap,
          child:Icon(Icons.add,color: AppColors.whiteColor,),
          backgroundColor: AppColors.greenLight,
        ),
      );
}