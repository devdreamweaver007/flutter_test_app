import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_strings.dart';
import 'package:flutter_test_app/Commons/common_flushbar.dart';
import 'package:flutter_test_app/Features/Authentication/Repository/login_repository.dart';
import 'package:flutter_test_app/Features/LocalStorage/storage.dart';

class AuthViewModel extends ChangeNotifier {
  bool ispasswordVisible = false;
  bool isChecked = false;
  AuthRepository _authRepository = AuthRepository();

  showpassword() {
    ispasswordVisible = !ispasswordVisible;
    notifyListeners();
  }

  check() {
    isChecked = !isChecked;
    notifyListeners();
  }

  login({required username, required password, required context}) async {
    await _authRepository
        .login(username: username, password: password, context: context)
        .then((value) {
          if(value?.token!=null){
           LocalStorage.storeToken(value?.token ?? "");
          }
      if (value?.status == false) {
        errorFlushbar(context, AppStrings.loginError);
      }
    });
    notifyListeners();
  }
}
