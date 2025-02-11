import 'package:e_commerce/core/constant/app_assets.dart';
import 'package:e_commerce/core/extensions/extensions.dart';
import 'package:e_commerce/core/utils/auth.dart';
import 'package:e_commerce/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../core/validations/validations.dart';
import '../../../core/widget/custom_text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppAssets.logo),
              0.02.horSpace(),
              Text(
                "Reset Password",
                style: theme.textTheme.bodyMedium,
              ),
              0.02.horSpace(),
              Text(
                "please write the email that will send an otp to it to restore the password code ",
                style: theme.textTheme.bodySmall,
              ),
              0.02.horSpace(),
              Text(
                "Email",
                style: theme.textTheme.bodySmall,
              ),
              0.01.horSpace(),
              CustomTextFormField(
                hintText: "Email@example.com",
                controller: emailController,
                validator: (value) =>
                    Validations.isEmailValid(emailController.text),
              ),
              0.01.horSpace(),
              CustomElevatedButton(
                text: "Reset Password",
                borderRadius: 10,
                callBack: () async {
                  if (formKey.currentState!.validate()) {
                    var response = await Authentication.forgetPassword(
                        email: emailController.text);
                    if (response == null) {
                      Navigator.pop(context);
                    }
                    else {
                      print("error ");
                    }
                  }
                },
              ),
            ],
          ).hPadding(0.03),
        ),
      ),
    );
  }
}
