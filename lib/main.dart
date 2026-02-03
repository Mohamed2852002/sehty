import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/utils/simple_bloc_observer.dart';
import 'package:sehty/sehty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await initDi();
  await Hive.initFlutter();
  runApp(const SehtyApp());
}