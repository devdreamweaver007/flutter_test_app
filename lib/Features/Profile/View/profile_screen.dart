import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/common_appbar.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';
import 'package:flutter_test_app/Features/LocalStorage/storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: commonAppbar(text: "Profile", size: size, isNormal: true),
      body: Center(
        child: GestureDetector(
          onTap: () {
            LocalStorage.logout(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "shutdown.png".imagePath,
                height: size * .3,
                width: size * .3,
              ),
              Text(
                "LOGOUT",
                style: mainFont(
                    fontsize: size * .05,
                    fontweight: FontWeight.bold,
                    color: AppColors.errorColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
