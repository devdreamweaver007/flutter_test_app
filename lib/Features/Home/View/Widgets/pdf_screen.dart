import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("pdflogo.png".imagePath))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: size*.1,),
              Row(
                children: [
                  Image.asset('logo.png'.imagePath,height: size*.2,width: size*.3,),
                  Spacer(),
                  Column(
                    children: [
                    Text("Name",),
                    Text("Address"),
                    Text("email"),
                    Text("GST NO")
                    ],
                  )
                ],
              ),
              customdiv(),
            ],
          ),
        ),
      ),
    );
  }
}

customdiv(){
  return Divider(
    thickness: .3,
    indent: 0,
    endIndent: 0,
    color: AppColors.blackColor,
  );
}