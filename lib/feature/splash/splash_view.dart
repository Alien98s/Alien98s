import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../../core/utilities/app_managers/assets_manager.dart';
import '../../core/utilities/app_managers/color_manager.dart';
import '../../core/utilities/app_managers/constance_manger.dart';
import '../../core/utilities/navigation/compass.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() => _timer = Timer(
        const Duration(seconds: AppConstants.splashDelay),
        _goToNextScreen,
      );

  _goToNextScreen() {
    Navigator.pushReplacementNamed(context, Compass.welcomeRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.main,
      body: const Center(
          child: Image(
        image: AssetImage(AssetsManagerImage.splashLogo),
        width: 300,
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
