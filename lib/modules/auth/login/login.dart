import 'dart:developer';
import 'package:e_commerce/core/services/services/bot_toast.dart';
import '/core/constant/app_assets.dart';
import '/core/route/route_names.dart';
import '/core/utils/auth.dart';
import '/core/widget/custom_text_button.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/extensions/extensions.dart';
import '/core/validations/validations.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.logo),
              Text(
                "Welcome Back",
                style: theme.textTheme.bodyMedium,
              ),
              0.03.horSpace(),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: theme.textTheme.bodySmall,
                    ),
                    0.01.horSpace(),
                    CustomTextFormField(
                      hintText: "Email",
                      controller: emailController,
                      validator: (value) =>
                          Validations.isEmailValid(emailController.text),
                    ),
                    0.02.horSpace(),
                    Text(
                      "Password",
                      style: theme.textTheme.bodySmall,
                    ),
                    0.01.horSpace(),
                    CustomTextFormField(
                      hintText: "Password",
                      isPassword: true,
                      controller: passwordController,
                      validator: (value) => Validations.isPasswordValid(
                        passwordController.text,
                      ),
                    ),
                    CustomTextButton(
                      text: "Forget Password",
                      style: theme.textTheme.bodySmall,
                      callback: () => Navigator.pushNamed(
                        context,
                        RouteNames.forget,
                      ),
                    ).right,
                    0.01.horSpace(),
                    CustomElevatedButton(
                      text: "Login",
                      borderRadius: 10,
                      callBack: () async {
                        if (formKey.currentState!.validate()) {
                          EasyLoading.show();
                          var response = await Authentication.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          EasyLoading.dismiss();
                          log("Response ${response.toString()}");

                          if (response == null) {
                            BotToastServices.showErrorMessage(
                              "Login Failed",
                            );
                          } else if (response == "user") {
                            BotToastServices.showSuccessMessage(
                              "User",
                            );
                          } else if (response == "admin") {
                            BotToastServices.showSuccessMessage(
                              "Admin",
                            );
                          }
                        }
                      },
                    ),
                    0.01.horSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: theme.textTheme.displaySmall,
                        ),
                        0.01.verSpace(),
                        CustomTextButton(
                          text: "Sign Up",
                          style: theme.textTheme.displayMedium,
                          callback: () => Navigator.pushNamed(
                            context,
                            RouteNames.sign,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ).hPadding(0.03),
        ),
      ),
    );
  }
}
