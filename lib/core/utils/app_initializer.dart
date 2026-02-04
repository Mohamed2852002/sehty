import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/utils/hive_helper.dart';
import 'package:sehty/core/utils/simple_bloc_observer.dart';

class AppInitializer {
  static Future<void> init() async {
    Bloc.observer = SimpleBlocObserver();
    await initDi();
    await HiveHelper.init();
  }
}
