import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../../../feature/forget_password/view/forget_password.dart';
import '../../../feature/home/view/home_page.dart';
import '../../../feature/register/view/register.dart';
import '../../../feature/settings/view/settings_page.dart';
import '../../../feature/splash/splash_view.dart';
import '../../../feature/verify/view/verify_page.dart';
import '../../../feature/welcome/view/welcome_page.dart';
import '../app_managers/strings_manager.dart';

class Compass {
  static const String splashRoute = "/";
  static const String welcomeRoute = "/welcome";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String verifyMobileRoute = "/verifyMobile";
  static const String homeRoute = "/home";
  static const String settingsRoute = "/settings";

  static final navigatorKey = GlobalKey<NavigatorState>();

  static get navBack => navigatorKey.currentState!.pop();
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Compass.splashRoute:
        return CupertinoPageRoute(builder: (_) => const SplashView());
      case Compass.welcomeRoute:
        return CupertinoPageRoute(builder: (_) => const WelcomeView());
      case Compass.settingsRoute:
        return CupertinoPageRoute(builder: (_) => const SettingsView());
      case Compass.verifyMobileRoute:
        return CupertinoPageRoute(builder: (_) => const VerifyView());
      case Compass.registerRoute:
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      case Compass.forgotPasswordRoute:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordView());
      case Compass.homeRoute:
        return CupertinoPageRoute(builder: (_) => const HomeLayout());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.noRouteFound),
        ),
        body: const Center(
          child: Text(StringsManager.noRouteFound),
        ),
      ),
    );
  }
}
