import '/core/extensions/extensions.dart';
import '/core/services/services/bot_toast.dart';
import '/core/utils/auth.dart';
import '/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constant/app_assets.dart';
import '../../core/validations/validations.dart';
import '../../core/widget/custom_text_form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();

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
                "Create New Account ",
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
                      "Name",
                      style: theme.textTheme.bodySmall,
                    ),
                    0.01.horSpace(),
                    CustomTextFormField(
                      hintText: "Name",
                      controller: nameController,
                      validator: (value) =>
                          Validations.isNameValid(nameController.text),
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
                    0.02.horSpace(),
                    Text(
                      "Confirm Password",
                      style: theme.textTheme.bodySmall,
                    ),
                    0.01.horSpace(),
                    CustomTextFormField(
                      hintText: "Confirm Password",
                      isPassword: true,
                      controller: confirmPasswordController,
                      validator: (value) => Validations.rePasswordValid(
                        passwordController.text,
                        confirmPasswordController.text,
                      ),
                    ),
                    0.01.horSpace(),
                    CustomElevatedButton(
                      text: "Create Account",
                      borderRadius: 10,
                      callBack: () async {
                        if (formKey.currentState!.validate()) {
                          EasyLoading.show();
                          var response = await Authentication.createAccount(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          ).then(
                            (_) {
                              EasyLoading.dismiss();
                            },
                          );
                          if (response == null) {
                            BotToastServices.showSuccessMessage(
                              "Account Created Successfully",
                            );
                            Navigator.pop(context);
                          } else {
                            BotToastServices.showErrorMessage(
                              response.toString(),
                            );
                          }
                        }
                      },
                    ),
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
