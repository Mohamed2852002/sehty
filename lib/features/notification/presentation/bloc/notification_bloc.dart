import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepo notificationRepo;

  NotificationBloc({required this.notificationRepo})
    : super(NotificationInitial()) {
    on<GetNotificationsEvent>(_onGetNotifications);
    on<RegisterDeviceTokenEvent>(_onRegisterDeviceToken);
  }

  Future<void> _onGetNotifications(
    GetNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    final result = await notificationRepo.getListOfNotifications();
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
    final result = await notificationRepo.registerDeviceToken(
      token: event.token,
      platform: event.platform,
    );
    result.fold(
      (failure) => emit(NotificationError(message: failure.errorMessage)),
      (_) => emit(DeviceTokenRegistered()),
    );
  }
}
