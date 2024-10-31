import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Features/Home/Model/patient_model.dart';

class PatientCards extends StatefulWidget {
  final List<Patient> patients;
  PatientCards({super.key, required, required this.patients});

  @override
  State<PatientCards> createState() => _PatientCardsState();
}

class _PatientCardsState extends State<PatientCards> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: size * .02,
      ),
      itemCount: widget.patients.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var patient = widget.patients[index];
        return GestureDetector(
          child: Container(
            width: size,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lightGrey),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${index + 1}",
                            style: mainFont(
                                fontsize: size * .04,
                                fontweight: FontWeight.w100,
                                color: AppColors.blackColor),
                          ),
                          Icon(Icons.person),
                          Text(
                            patient.name == ""?
                            "Annonymus":
                            patient.name ?? "User",
                            style: mainFont(
                                fontsize: size * .04,
                                fontweight: FontWeight.w600,
                                color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size * .02,
                      ),
                      Text(
                        "${patient.branch?.name ?? "Branch Name"} (${patient.branch?.address ?? "Address"}) ${patient.branch?.mail ?? ""}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: normalFont(
                            fontsize: size * .03,
                            fontweight: FontWeight.w500,
                            color: AppColors.greenColor),
                      ),
                      SizedBox(
                        height: size * .02,
                      ),
                      Row(children: [
                        Icon(Icons.calendar_month,size: size*.05,color: AppColors.errorColor,),
                        Text(patient.dateNdTime ?? "10/10/2029",style: normalFont(
                            fontsize: size * .03,
                            fontweight: FontWeight.w500,
                            color: AppColors.greyColor),),
                            SizedBox(width: size*.03,),
                            Icon(Icons.person_2_outlined,size: size*.05,color: AppColors.errorColor,),
                        Text(
                          patient.user == ""?
                          "Annonymous":
                          patient.user ?? "Anonym0us",style: normalFont(
                            fontsize: size * .03,
                            fontweight: FontWeight.w500,
                            color: AppColors.greyColor),),
                      ],)
                    ],
                  ),
                ),
                Divider(
                  thickness: .2,
                  color: AppColors.blackColor,
                  endIndent: 0,
                  indent: 0,
                ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                 child: Row(
                   children: [
                     Text("Show Booking Details",style:normalFont(
                            fontsize: size * .04,
                            fontweight: FontWeight.w300,
                            color: AppColors.blackColor),),
                     Spacer(),
                     Icon(Icons.arrow_right_sharp,color: AppColors.blackColor,)
                   ],
                 ),
               )
              ],
            ),
          ),
        );
      },
    );
  }
}
