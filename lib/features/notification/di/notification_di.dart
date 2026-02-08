import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:sehty/features/notification/data/repositories/notification_repo_impl.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';
import 'package:sehty/features/notification/presentation/bloc/notification_bloc.dart';

Future<void> initNotificationDi() async {
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<NotificationRepo>(
    () => NotificationRepoImpl(
      notificationRemoteDataSource: sl<NotificationRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<NotificationBloc>(
    () => NotificationBloc(notificationRepo: sl<NotificationRepo>()),
  );
}
