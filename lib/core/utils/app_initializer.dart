import 'dart:io';

import 'package:sehty/core/services/firebase_messaging_service.dart';
import 'package:sehty/core/services/local_notification_service.dart';
import 'package:sehty/features/notification/domain/usecases/register_device_token_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/utils/app_constants.dart';
import 'package:sehty/core/utils/hive_helper.dart';
import 'package:sehty/core/utils/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';

class AppInitializer {
  static String? token;

  static Future<void> init() async {
    await Firebase.initializeApp();
    Bloc.observer = SimpleBlocObserver();
    await initDi();
    await LocalNotificationService.init();
    await sl<FirebaseMessagingService>().init();
    final fcmToken = await sl<FirebaseMessagingService>().getToken();
    if (fcmToken != null) {
      await sl<RegisterDeviceTokenUseCase>().call(
        token: fcmToken,
        platform: Platform.operatingSystem,
      );
    }
    await HiveHelper.init();

    final secureStorage = sl<FlutterSecureStorage>();
    token = await secureStorage.read(key: AppConstants.kToken);
  }
}
