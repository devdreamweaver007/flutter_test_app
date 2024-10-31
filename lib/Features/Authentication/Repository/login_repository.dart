import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_app/Commons/app_strings.dart';
import 'package:flutter_test_app/Commons/base_urls.dart';
import 'package:flutter_test_app/Commons/common_flushbar.dart';
import 'package:flutter_test_app/Extentions/enum_routes.dart';
import 'package:flutter_test_app/Features/Authentication/Model/login_response_model.dart';

class AuthRepository {
  Future<LoginResponseModel?> login(
      {required String username, required String password,required context}) async {
         EasyLoading.show();
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var data = {'username': username, 'password': password};
      var dio = Dio();
      var response = await dio.request(
        '${Baseurls.baseUrl}Login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        successFlushbar(context, AppStrings.loginSuccess);
        goHome(context);
        return LoginResponseModel.fromJson(response.data);
      } else {
        EasyLoading.dismiss();
        print(response.statusMessage);
      }
    }on DioException catch (e) {
      EasyLoading.dismiss();
      if(e.response?.statusCode==null){
        errorFlushbar(context, AppStrings.serverError);
      }
    }
  }
}
