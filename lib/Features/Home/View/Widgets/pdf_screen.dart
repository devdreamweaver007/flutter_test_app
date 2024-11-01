import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/custom_button.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class PdfScreen extends StatefulWidget {
  final String selectedTreatment;
  final String slectedBranch;
  final AddPatient patientdetails;

  const PdfScreen({
    super.key,
    required this.patientdetails,
    required this.selectedTreatment,
    required this.slectedBranch,
  });

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size.width;

    return PopScope(
      onPopInvoked: (didPop) {
        homeViewModel.getPatients(context);
        homeViewModel.clearAllcontroller();
        homeViewModel.createdList.clear();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("pdflogo.png".imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size * 0.05),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'logo.png'.imagePath,
                            height: size * 0.2,
                            width: size * 0.3,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.slectedBranch,
                                  style: normalFont(
                                      fontsize: size * .04,
                                      fontweight: FontWeight.w400,
                                      color: AppColors.blackColor)),
                              SizedBox(height: 4),
                              SizedBox(
                                width: size * .4,
                                child: Text(
                                  "Chaithanya Apartments, Flat No. 5B Anand Nagar,\nVazhuthacaud, Thiruvananthapuram, Kerala",
                                  style: normalFont(
                                      fontsize: size * .03,
                                      fontweight: FontWeight.w100,
                                      color: AppColors.blackColor),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "GST NO: 12678975534",
                                style: normalFont1(
                                    fontsize: size * .03,
                                    fontweight: FontWeight.w100,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size * 0.03),
                      customDivider(),
                      SizedBox(height: size * 0.03),
                      Text("Patient Details",
                          style: normalFont(
                              fontsize: size * .04,
                              fontweight: FontWeight.w500,
                              color: AppColors.greenColor)),
                      SizedBox(height: size * 0.02),
                      customRow(
                        "Name: ${widget.patientdetails.name}",
                        "Date: ${widget.patientdetails.dateAndTime}",
                        size,
                      ),
                      customRow("Address: ${widget.patientdetails.address}", "",
                          size),
                      customRow(
                        "Contact No: ${widget.patientdetails.phone}",
                        "",
                        size,
                      ),
                      SizedBox(height: size * 0.03),
                      customDivider(),
                      SizedBox(height: size * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customColumn("Treatment",
                              homeViewModel.selectedtreatemnts ?? "", size),
                          customColumn("Price",
                              widget.patientdetails.advanceAmount, size),
                          customColumn(
                              "Male", widget.patientdetails.male, size),
                          customColumn(
                              "Female", widget.patientdetails.female, size),
                          customColumn("Payment Type",
                              widget.patientdetails.payment, size),
                        ],
                      ),
                      SizedBox(height: size * 0.04),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Total Amount: ",
                              style: normalFont(
                                  fontsize: size * .04,
                                  fontweight: FontWeight.w100,
                                  color: AppColors.blackColor),
                            ),
                            Text("₹ ${widget.patientdetails.totalAmount}",
                                style: normalFont1(
                                    fontsize: size * .04,
                                    fontweight: FontWeight.w100,
                                    color: AppColors.greenColor)),
                          ],
                        ),
                      ),
                      SizedBox(height: size * 0.04),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Thank you for choosing us!",
                            style: normalFont1(
                                fontsize: size * .05,
                                fontweight: FontWeight.w100,
                                color: AppColors.greenColor)),
                      ),
                      SizedBox(
                        height: size * .06,
                      ),
                      customButton(
                          size: size,
                          text: "SAVE",
                          color: AppColors.greenColor,
                          ontap: () {
                            Navigator.pop(context);
                            homeViewModel.clearAllcontroller();
                            homeViewModel.createdList.clear();
                            homeViewModel.getPatients(context);
                          }),
                      SizedBox(
                        height: size * .2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDivider() {
    return Divider(
      thickness: 1,
      color: AppColors.blackColor,
    );
  }

  Widget customRow(String left, String right, double size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left,
              style: normalFont(
                  fontsize: size * .03,
                  fontweight: FontWeight.w100,
                  color: AppColors.blackColor)),
          Text(right,
              style: normalFont(
                  fontsize: size * .03,
                  fontweight: FontWeight.w100,
                  color: AppColors.blackColor)),
        ],
      ),
    );
  }

  Widget customColumn(String top, String bottom, double size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(top,
            style: normalFont(
                fontsize: size * .03,
                fontweight: FontWeight.w100,
                color: AppColors.greenColor)),
        SizedBox(height: size * 0.01),
        SizedBox(
            width: size * .14,
            child: SizedBox(
                child: Text(bottom,
                    style: normalFont(
                        fontsize: size * .03,
                        fontweight: FontWeight.w100,
                        color: AppColors.blackColor)))),
      ],
    );
  }
}
