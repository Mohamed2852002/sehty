import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_initializer.dart';
import 'package:sehty/sehty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(const SehtyApp());
}
