import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/services/api_services.dart';
import '../di/injection_container.dart';

Future<void> initCore() async {
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiServices>(ApiServices(dio: sl<Dio>()));
}
