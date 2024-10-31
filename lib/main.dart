import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Features/Authentication/ViewModel/auth_view_model.dart';
import 'package:flutter_test_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:flutter_test_app/Features/Splash/View/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.greenColor
    ..backgroundColor = Colors.white
    ..maskColor = Colors.transparent 
    ..indicatorColor = AppColors.greenColor
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:SplashScreen(),
         builder: (context, child) {
          return EasyLoading.init()(context, child);
        },
      ),
    );
  }
}

