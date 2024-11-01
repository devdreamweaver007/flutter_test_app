import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/custom_bottom_nav_bar.dart';
import 'package:flutter_test_app/Features/Authentication/View/login_screen.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/View/Widgets/pdf_screen.dart';
import 'package:flutter_test_app/Features/Home/View/add_patient.dart';

enum NavigationType { push, pushReplacement, pop, pushAndRemoveUntil }

void navigate({
  required BuildContext context,
  required Widget screen,
  NavigationType type = NavigationType.push,
}) {
  switch (type) {
    case NavigationType.push:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
      break;
    case NavigationType.pushReplacement:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
      break;
    case NavigationType.pop:
      Navigator.pop(context);
      break;
    case NavigationType.pushAndRemoveUntil:
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen),
          (Route route) => false);
  }
}

goLoginReplace(context) {
  navigate(
      context: context,
      screen: LoginScreen(),
      type: NavigationType.pushReplacement);
}

goHome(context) {
  navigate(
      context: context,
      screen: MainNavigationScreen(),
      type: NavigationType.pushAndRemoveUntil);
}

addPatient(context) {
  navigate(
      context: context, screen: AddPatientScreen(), type: NavigationType.push);
}

goLoginClearRoute(context) {
  navigate(
      context: context,
      screen: LoginScreen(),
      type: NavigationType.pushAndRemoveUntil);
}

goPdfScreen(
    {required context,
    required AddPatient patient,
    required String slectedtreatment,
    required String selectedBranch}) {
  navigate(
      context: context,
      screen: PdfScreen(
          patientdetails: patient,
          selectedTreatment: slectedtreatment,
          slectedBranch: selectedBranch),type: NavigationType.pushReplacement);
}
