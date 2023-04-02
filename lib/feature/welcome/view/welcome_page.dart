import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../../../core/utilities/app_managers/assets_manager.dart';
import '../../../core/utilities/app_managers/color_manager.dart';
import '../../../core/utilities/app_managers/values_manager.dart';
import '../../../core/utilities/navigation/compass.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(AssetsManagerImage.splashLogo),
            color: ColorsManager.main4,
          ),
          const SizedBox(
            height: SizeManager.s80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
            child: Text(
              "الشعار",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
                left: PaddingManager.p16, right: PaddingManager.p16),
            child: SizedBox(
              width: double.infinity,
              height: SizeManager.s48,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Compass.registerRoute);
                  },
                  child: Text("تسجيل الدخول",
                      style: Theme.of(context).textTheme.titleMedium)),
            ),
          ),
          const SizedBox(
            height: SizeManager.s16,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: PaddingManager.p16, right: PaddingManager.p16),
            child: SizedBox(
              width: double.infinity,
              height: SizeManager.s48,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Compass.registerRoute);
                },
                child: Text("انشاء حساب",
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
