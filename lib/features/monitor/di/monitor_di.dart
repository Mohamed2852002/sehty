import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/monitor/data/datasources/monitor_remote_data_source.dart';
import 'package:sehty/features/monitor/data/repositories/monitor_repo_impl.dart';
import 'package:sehty/features/monitor/domain/repositories/monitor_repo.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';

Future<void> initMonitorDi() async {
  sl.registerLazySingleton<MonitorRemoteDataSource>(
    () => MonitorRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<MonitorRepo>(
    () => MonitorRepoImpl(monitorRemoteDataSource: sl<MonitorRemoteDataSource>()),
  );

  sl.registerLazySingleton<MonitorBloc>(
    () => MonitorBloc(monitorRepo: sl<MonitorRepo>()),
  );
}
