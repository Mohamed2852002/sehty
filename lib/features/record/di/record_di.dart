import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/record/data/datasources/record_remote_data_source.dart';
import 'package:sehty/features/record/data/repositories/record_repo_impl.dart';
import 'package:sehty/features/record/domain/repositories/record_repo.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';

Future<void> initRecordDi() async {
  sl.registerLazySingleton<RecordRemoteDataSource>(
    () => RecordRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<RecordRepo>(
    () => RecordRepoImpl(recordRemoteDataSource: sl<RecordRemoteDataSource>()),
  );

  sl.registerLazySingleton<RecordBloc>(
    () => RecordBloc(recordRepo: sl<RecordRepo>()),
  );
}
