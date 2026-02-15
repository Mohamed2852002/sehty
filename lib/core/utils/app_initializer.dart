import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/utils/app_constants.dart';
import 'package:sehty/core/utils/hive_helper.dart';
import 'package:sehty/core/utils/simple_bloc_observer.dart';

class AppInitializer {
  static String? token;

  static Future<void> init() async {
    Bloc.observer = SimpleBlocObserver();
    await initDi();
    await HiveHelper.init();

    final secureStorage = sl<FlutterSecureStorage>();
    token = await secureStorage.read(key: AppConstants.kToken);
  }
}
