import 'package:flutter_test_app/Extentions/enum_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static storeToken(String token)async{
   SharedPreferences prefs = await  SharedPreferences.getInstance();
   prefs.setString("token", token);
  }

  static checkToken(context)async {
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    String?token = prefs.getString("token");
    if(token!=null){
      goHome(context);
    }else{
      goLoginReplace(context);
    }
  }

  static logout(context)async {
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    prefs.remove("token");
    goLoginClearRoute(context);
  }
}
