import 'package:flutter/material.dart';
import 'package:flutter_test_app/Commons/app_colors.dart';
import 'package:flutter_test_app/Commons/app_strings.dart';
import 'package:flutter_test_app/Commons/common_flushbar.dart';
import 'package:flutter_test_app/Commons/custom_button.dart';
import 'package:flutter_test_app/Commons/custom_input_decoration.dart';
import 'package:flutter_test_app/Commons/google_fonts.dart';
import 'package:flutter_test_app/Extentions/reg_exp.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';
import 'package:flutter_test_app/Features/Authentication/View/Widgets/agree_terms.dart';
import 'package:flutter_test_app/Features/Authentication/View/Widgets/custom_home_widgets.dart';
import 'package:flutter_test_app/Features/Authentication/ViewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String email = "Username";
  final String hintEmail = "Enter Your username";
  final String password = "Password";
  final String hintPass = "Enter Your Password";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authViewmodel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("login.png".imagePath),
                Image.asset(
                  "logo.png".imagePath,
                  height: size * .3,
                  width: size * .2,
                  fit: BoxFit.contain,
                )
              ],
            ),
            gapB(context, size),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.loginText,
                      style: mainFont(
                          fontsize: size * .05,
                          fontweight: FontWeight.w600,
                          color: AppColors.blackColor),
                    ),
                    gapB(context, size),
                    customtext(email, size),
                    gaps(context, size),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (FieldValidator.isFieldEmpty(value ?? "")) {
                          return AppStrings.required;
                        }
                      },
                      decoration: customInputDecoration(
                          size: size,
                          hinttext: hintEmail,
                          icon: Icons.person,
                          onTap: () {}),
                    ),
                    gapM(context, size),
                    customtext(password, size),
                    gaps(context, size),
                    TextFormField(
                      controller: passwordController,
                      obscureText: authViewmodel.ispasswordVisible,
                      validator: (value) {
                        if (FieldValidator.isFieldEmpty(value ?? "")) {
                          return AppStrings.required;
                        }
                      },
                      decoration: customInputDecoration(
                          size: size,
                          hinttext: hintPass,
                          icon:authViewmodel.ispasswordVisible? Icons.key_off: Icons.key,
                          onTap: () {
                            authViewmodel.showpassword();
                          }),
                    ),
                    SizedBox(
                      height: size * .2,
                    ),
                    customButton(
                        size: size,
                        text: "Login",
                        color: authViewmodel.isChecked
                            ? AppColors.greenColor
                            : AppColors.greyColor,
                        ontap: () {
                          if (_formKey.currentState!.validate() &&
                              authViewmodel.isChecked) {
                            authViewmodel.login(username:emailController.text, password: passwordController.text, context: context);
                          } else if (!authViewmodel.isChecked) {
                            errorFlushbar(context, AppStrings.agreeterms);
                          }
                        }),
                    gapB(context, size),
                    termsAndConditions(
                        isChecked: authViewmodel.isChecked,
                        onChanged: (bool? value) {
                          authViewmodel.check();
                        },
                        size: size)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
