import 'package:flutter/material.dart';
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
  List<Patient> patients = [];
  HomeRepository _homerepo = HomeRepository();
  bool isloading = true;
  List<Treatments>treatments = [];
  List <MyBranch> branches = [];
  final List<String> keralaAddresses = [
  "Varkala, Thiruvananthapuram, Kerala, 695141",
  "Fort Kochi, Ernakulam, Kerala, 682001",
  "Munnar, Idukki, Kerala, 685612",
  "Kumarakom, Kottayam, Kerala, 686563",
];
final List<String> payMnetType = [
  "Card",
  "Online Upi",
  "Cash"
];


  getPatients() async {
    await _homerepo.getAllPatients().then((value) {
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

  getAlltreatments()async{
    await _homerepo.treatementList().then((value){
      if(value!=null){
        treatments = value.treatments ??[];
      }
    });
    notifyListeners();
  }

  getAllBranchs()async{
    await _homerepo.branchList().then((value){
      if(value!=null){
        branches = value.branches ??[];
      }
    });
    notifyListeners();
  }
}
