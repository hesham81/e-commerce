import '/core/route/route_names.dart';
import 'package:flutter/material.dart';
import '../../modules/auth/login/login.dart';
import '../../modules/splash/splash.dart';

abstract class Routes
{
  static Route onGenerateRoutes(RouteSettings settings)
  {
    switch(settings.name)
    {
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const Login());

      default:
        return MaterialPageRoute(builder: (context) => const Splash());
    }
  }
}