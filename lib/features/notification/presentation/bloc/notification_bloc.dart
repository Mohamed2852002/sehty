import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/domain/usecases/get_notifications_usecase.dart';
import 'package:sehty/features/notification/domain/usecases/listen_to_token_refresh_usecase.dart';
import 'package:sehty/features/notification/domain/usecases/register_device_token_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final RegisterDeviceTokenUseCase registerDeviceTokenUseCase;
  final ListenToTokenRefreshUseCase listenToTokenRefreshUseCase;

  NotificationBloc({
    required this.getNotificationsUseCase,
    required this.registerDeviceTokenUseCase,
    required this.listenToTokenRefreshUseCase,
  }) : super(NotificationInitial()) {
    on<GetNotificationsEvent>(_onGetNotifications);
    on<RegisterDeviceTokenEvent>(_onRegisterDeviceToken);

    _listenToTokenRefresh();
  }

  StreamSubscription<String>? _tokenRefreshSubscription;

  void _listenToTokenRefresh() {
    _tokenRefreshSubscription = listenToTokenRefreshUseCase().listen((token) {
      add(
        RegisterDeviceTokenEvent(
          token: token,
          platform: Platform.operatingSystem,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _tokenRefreshSubscription?.cancel();
    return super.close();
  }

  Future<void> _onGetNotifications(
    GetNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    final result = await getNotificationsUseCase();
    result.fold(
      (failure) => emit(NotificationError(message: failure.errorMessage)),
      (notifications) =>
          emit(NotificationsLoaded(notifications: notifications)),
    );
  }

  Future<void> _onRegisterDeviceToken(
    RegisterDeviceTokenEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    final result = await registerDeviceTokenUseCase(
      token: event.token,
      platform: event.platform,
    );
    result.fold(
      (failure) => emit(NotificationError(message: failure.errorMessage)),
      (_) => emit(DeviceTokenRegistered()),
    );
  }
}
