import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/home/data/datasources/home_remote_data_source.dart';
import 'package:sehty/features/home/data/repositories/home_repo_impl.dart';
import 'package:sehty/features/home/domain/repositories/home_repo.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHomeDi() async {
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiServices: sl.get<ApiServices>()),
  );

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: sl.get<HomeRemoteDataSource>()),
  );

  sl.registerLazySingleton<HomeBloc>(
    () => HomeBloc(homeRepo: sl.get<HomeRepo>()),
  );
}
