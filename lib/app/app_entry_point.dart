import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../core/utilities/app_managers/theme_manager.dart';
import '../core/utilities/navigation/compass.dart';

class SaifAttayaApp extends StatefulWidget {
  const SaifAttayaApp._internal(); // named constructor

  static const _instance =
      SaifAttayaApp._internal(); // singleton design pattern || Single Instance

  factory SaifAttayaApp() => _instance; // Factory Method

  @override
  State<SaifAttayaApp> createState() => _SaifAttayaAppState();
}

class _SaifAttayaAppState extends State<SaifAttayaApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Compass.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemesManager.lightTheme,
      initialRoute: Compass.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
