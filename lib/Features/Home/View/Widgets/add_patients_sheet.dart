import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/custom_button.dart';
import 'package:flutter_test_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

void showCustomBottomSheet(BuildContext context, double size) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                'Add Patients',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size * .03),
              PatientCounter(label: 'Male'),
              SizedBox(height: size * .03),
            ],
          ),
        ),
      );
    },
  );
}

class PatientCounter extends StatefulWidget {
  final String label;
  PatientCounter({required this.label});

  @override
  _PatientCounterState createState() => _PatientCounterState();
}

class _PatientCounterState extends State<PatientCounter> {
  late HomeViewModel homeViewModel = HomeViewModel();

  void increment(bool isman) {
    setState(() {
      isman ? homeViewModel.man++ : homeViewModel.women++;
    });
  }

  void decrement(bool isman) {
    if (isman) {
      if (homeViewModel.man > 0) {
        setState(() {
          homeViewModel.man--;
        });
      }
    } else {
      if (homeViewModel.women > 0) {
        setState(() {
          homeViewModel.women--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    homeViewModel = Provider.of<HomeViewModel>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("MAN"),
            ),
            Row(
              children: [
                customPlusButton(() {
                  decrement(true);
                }, size, false),
                SizedBox(
                  width: size * .06,
                  child: Text(
                    '${homeViewModel.man}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                customPlusButton(() {
                  increment(true);
                }, size, true)
              ],
            ),
          ],
        ),
        SizedBox(
          height: size * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Women"),
            ),
            Row(
              children: [
                customPlusButton(() {
                  decrement(false);
                }, size, false),
                SizedBox(
                  width: size * .06,
                  child: Text(
                    '${homeViewModel.women}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                customPlusButton(() {
                  increment(false);
                }, size, true)
              ],
            ),
          ],
        ),
        SizedBox(
          height: size * .05,
        ),
        customButton(
            size: size,
            text: "Save",
            color: AppColors.greenColor,
            ontap: () {
              homeViewModel.maleFemaleController.text =
                  'Male(${homeViewModel.man})women(${homeViewModel.women})';
              Navigator.pop(context);
            }),
        SizedBox(height: size * .2),
      ],
    );
  }
}

customPlusButton(VoidCallback ontap, double size, bool isPlus) {
  return GestureDetector(
    onTap: ontap,
    child: CircleAvatar(
      backgroundColor: AppColors.greenColor,
      radius: size * .04,
      child: Icon(
        isPlus ? Icons.add : Icons.remove,
        size: size * .06,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
