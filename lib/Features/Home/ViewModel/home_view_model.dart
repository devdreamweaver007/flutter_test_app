import 'package:flutter/material.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/branch_response_model.dart';
import 'package:flutter_test_app/Features/Home/Model/patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/treatement_response_model.dart';
import 'package:flutter_test_app/Features/Home/Repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController executiveController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController treatmentsController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();
  final TextEditingController maleFemaleController = TextEditingController();
  final TextEditingController treatmentIdController = TextEditingController();
  final TextEditingController branchControllerid = TextEditingController();
  int man = 0;
  int women = 0;
  List<Patient> patients = [];
  HomeRepository _homerepo = HomeRepository();
  bool isloading = true;
  List<Treatments> treatments = [];
  List<MyBranch> branches = [];
  final List<String> keralaAddresses = [
    "Varkala, Thiruvananthapuram, Kerala, 695141",
    "Fort Kochi, Ernakulam, Kerala, 682001",
    "Munnar, Idukki, Kerala, 685612",
    "Kumarakom, Kottayam, Kerala, 686563",
  ];
  final List<String> payMnetType = ["Card", "Online Upi", "Cash"];

  getPatients(context) async {
    await _homerepo.getAllPatients(context).then((value) {
      isloading = true;
      if (value != null) {
        isloading = false;
        patients = value.patient?.take(30).toList() ?? [];
      } else {
        isloading = false;
      }
    });
    notifyListeners();
  }

  getAlltreatments(context) async {
    await _homerepo.treatementList(context).then((value) {
      if (value != null) {
        treatments = value.treatments ?? [];
      }
    });
    notifyListeners();
  }

  getAllBranchs(context) async {
    await _homerepo.branchList(context).then((value) {
      if (value != null) {
        branches = value.branches ?? [];
      }
    });
    notifyListeners();
  }

  addPatient({required context, required AddPatient patient}) async {
    await _homerepo.addPatient(
        context: context,
        patients: patient,
        selectedTreatments: treatmentsController.text,
        selectedBranch: branchController.text);
    notifyListeners();
  }

   clearAllcontroller() {
    nameController.clear();
    executiveController.clear();
    phoneController.clear();
    addressController.clear();
    totalAmountController.clear();
    dateController.clear();
    discountAmountController.clear();
    advanceAmountController.clear();
    balanceAmountController.clear();
    peopleController.clear();
    treatmentsController.clear();
    branchController.clear();
    paymentController.clear();
    maleFemaleController.clear();
    treatmentIdController.clear();
    branchControllerid.clear();
    notifyListeners();
  }
}
