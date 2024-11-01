import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_app/Commons/app_strings.dart';
import 'package:flutter_test_app/Commons/base_urls.dart';
import 'package:flutter_test_app/Commons/common_flushbar.dart';
import 'package:flutter_test_app/Extentions/enum_routes.dart';
import 'package:flutter_test_app/Features/Home/Model/add_patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/branch_response_model.dart';
import 'package:flutter_test_app/Features/Home/Model/patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/treatement_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<PatientResponseModel?> getAllPatients(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var dio = Dio();
      var response = await dio.request(
        '${Baseurls.baseUrl}PatientList',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return PatientResponseModel.fromJson(response.data);
      } else {
        errorFlushbar(context, AppStrings.serverError);
        print(response.statusMessage);
      }
    } catch (e) {
      errorFlushbar(context, AppStrings.serverError);
      print(e);
    }
  }

  Future<TreatementResponsemodel?> treatementList(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    EasyLoading.show();
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var dio = Dio();
      var response = await dio.request(
        '${Baseurls.baseUrl}TreatmentList',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return TreatementResponsemodel.fromJson(response.data);
      } else {
        errorFlushbar(context, AppStrings.failedFetching);
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorFlushbar(context, AppStrings.failedFetching);
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future<BranchResponseModel?> branchList(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    EasyLoading.show();
    try {
      var headers = {'Authorization': 'Bearer $token'};
      var dio = Dio();
      var response = await dio.request(
        '${Baseurls.baseUrl}BranchList',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return BranchResponseModel.fromJson(response.data);
      } else {
        errorFlushbar(context, AppStrings.failedFetching);
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorFlushbar(context, AppStrings.failedFetching);
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future addPatient(
      {required context,
      required AddPatient patients,
      required String selectedTreatments,
      required String selectedBranch}) async {
    EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token'
      };
      var data = patients.toJson();
      var dio = Dio();
      var response = await dio.request(
        '${Baseurls.baseUrl}PatientUpdate',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        goPdfScreen(
            context: context,
            patient: patients,
            slectedtreatment: selectedTreatments,
            selectedBranch: selectedBranch);
        successFlushbar(context, AppStrings.success);
      } else {
        EasyLoading.dismiss();
        errorFlushbar(context, AppStrings.failed);
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorFlushbar(context, AppStrings.failed);
      print(e);
    }
  }
}
