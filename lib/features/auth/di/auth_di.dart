import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sehty/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:sehty/features/auth/domain/repositories/auth_repo.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> initAuthDi() async {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiServices: sl<ApiServices>()),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: sl<AuthRemoteDataSource>(),
      flutterSecureStorage: sl<FlutterSecureStorage>(),
    ),
  );
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(authRepo: sl<AuthRepo>()));
}
