import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_app/Commons/base_urls.dart';
import 'package:flutter_test_app/Features/Home/Model/branch_response_model.dart';
import 'package:flutter_test_app/Features/Home/Model/patient_model.dart';
import 'package:flutter_test_app/Features/Home/Model/treatement_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<PatientResponseModel?> getAllPatients() async {
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
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<TreatementResponsemodel?> treatementList() async {
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
        EasyLoading.dismiss();
      }
    } catch (e) {
        EasyLoading.dismiss();
      print(e);
    }
  }

  Future<BranchResponseModel?> branchList() async {
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
        EasyLoading.dismiss();
      }
    } catch (e) {
        EasyLoading.dismiss();
      print(e);
    }
  }
}
