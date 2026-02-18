import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/firebase_messaging_service.dart';
import 'package:sehty/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:sehty/features/notification/data/repositories/notification_repo_impl.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';
import 'package:sehty/features/notification/domain/usecases/get_notifications_usecase.dart';
import 'package:sehty/features/notification/domain/usecases/listen_to_token_refresh_usecase.dart';
import 'package:sehty/features/notification/domain/usecases/register_device_token_usecase.dart';
import 'package:sehty/features/notification/presentation/bloc/notification_bloc.dart';

Future<void> initNotificationDi() async {
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<NotificationRepo>(
    () => NotificationRepoImpl(
      notificationRemoteDataSource: sl<NotificationRemoteDataSource>(),
      firebaseMessagingService: sl<FirebaseMessagingService>(),
    ),
  );

  sl.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(notificationRepo: sl<NotificationRepo>()),
  );

  sl.registerLazySingleton<RegisterDeviceTokenUseCase>(
    () => RegisterDeviceTokenUseCase(notificationRepo: sl<NotificationRepo>()),
  );

  sl.registerLazySingleton<ListenToTokenRefreshUseCase>(
    () => ListenToTokenRefreshUseCase(notificationRepo: sl<NotificationRepo>()),
  );

  sl.registerLazySingleton<NotificationBloc>(
    () => NotificationBloc(
      getNotificationsUseCase: sl<GetNotificationsUseCase>(),
      registerDeviceTokenUseCase: sl<RegisterDeviceTokenUseCase>(),
      listenToTokenRefreshUseCase: sl<ListenToTokenRefreshUseCase>(),
    ),
  );
}
