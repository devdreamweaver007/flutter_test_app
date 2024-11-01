import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/common_appbar.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Extentions/enum_routes.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/custom_loading.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/floating_actionbutton.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/patient_cards.dart';
import 'package:flutter_test_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String noPatient = "There is no patients";
  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.getPatients(context);
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      backgroundColor: AppColors.whiteColor,
      color: AppColors.greenColor,
      onRefresh: () async {
        Duration(milliseconds: 1200);
        await homeViewModel.getPatients(context);
      },
      child: Scaffold(
        floatingActionButton: customFloatButton(() {
          addPatient(context);
        }),
        backgroundColor: AppColors.whiteColor,
        appBar:
            commonAppbar(text: "Available Patient", size: size, isNormal: true),
        body: homeViewModel.isloading
            ? Center(
                child: showSpinkits(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: !homeViewModel.isloading &&
                        homeViewModel.patients.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Image.asset("empty.jpg".imagePath),
                            Text(
                              noPatient,
                              style: mainFont(
                                  fontsize: size * .04,
                                  fontweight: FontWeight.w500,
                                  color: AppColors.blackColor),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: size * .04,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child:
                                PatientCards(patients: homeViewModel.patients),
                          ),
                          SizedBox(
                            height: size * .2,
                          )
                        ],
                      ),
              ),
      ),
    );
  }
}
