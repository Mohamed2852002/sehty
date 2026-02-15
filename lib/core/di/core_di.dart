import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/auth_interceptors.dart';
import 'package:sehty/core/services/endpoints.dart';
import '../di/injection_container.dart';

Future<void> initCore() async {
  sl.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<FlutterSecureStorage>()),
  );

  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(sl<AuthInterceptor>()),
  );
  sl.registerSingleton<ApiServices>(ApiServices(dio: sl<Dio>()));
}
