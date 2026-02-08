import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:sehty/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:sehty/features/profile/domain/repositories/profile_repo.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';

Future<void> initProfileDi() async {
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<ProfileRepo>(
    () =>
        ProfileRepoImpl(profileRemoteDataSource: sl<ProfileRemoteDataSource>()),
  );

  sl.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(profileRepo: sl<ProfileRepo>()),
  );
}
