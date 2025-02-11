import '/modules/sign_up/sign_up.dart';
import '/modules/auth/forget_password/forget_password.dart';
import '/core/route/route_names.dart';
import 'package:flutter/material.dart';
import '../../modules/auth/login/login.dart';
import '../../modules/splash/splash.dart';

abstract class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case RouteNames.forget:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case RouteNames.sign:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );

      default:
        return MaterialPageRoute(builder: (context) => const Splash());
    }
  }
}
