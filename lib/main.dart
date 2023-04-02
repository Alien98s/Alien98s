import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'app/app_entry_point.dart';
import 'app/configs/injection.dart';
import 'app/configs/pre_configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureFirebase();
  await configureDependencies();
  runApp(SaifAttayaApp());
}
