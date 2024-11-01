import 'package:flutter/material.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/add_treatment.dart';
import 'package:flutter_test_app/Features/Home/Model/branch_response_model.dart';
import 'package:flutter_test_app/Features/Home/Model/patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/treatement_response_model.dart';
import 'package:flutter_test_app/Features/Home/Repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  List<MyModel> createdList = [];
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
  String alltreatementids = "";
  String allmenCount = "";
  String allWomenCounts = "";
  String? selectedtreatemnts = "";
  int man = 0;
  int women = 0;

  addToList() {
    createdList.add(MyModel(
        id: treatmentIdController.text,
        name: treatmentsController.text,
        man: "${man}",
        women: "${women}"));
    notifyListeners();
  }

  String getAllTreatments() {
    return createdList.map((item) => item.name).join(',');
  }

  String getAllTreatmentIds() {
    return createdList.map((item) => item.id).join(',');
  }

  String getAllMenCounts() {
    return createdList.map((item) => item.man.toString()).join(',');
  }

  String getAllWomenCounts() {
    return createdList.map((item) => item.women.toString()).join(',');
  }

  void addAllCounts() {
    selectedtreatemnts = getAllTreatments();
    alltreatementids = getAllTreatmentIds();
    allmenCount = getAllMenCounts();
    allWomenCounts = getAllWomenCounts();
  }

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
        // !NB(hi dev devs team) there is no pagination so i take only 30 of items from list there is 1500 itesm i think loading all of it make take more time
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
