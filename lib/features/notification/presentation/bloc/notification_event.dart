part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class GetNotificationsEvent extends NotificationEvent {}

class RegisterDeviceTokenEvent extends NotificationEvent {
  final String token;
  final String platform;

  const RegisterDeviceTokenEvent({required this.token, required this.platform});

  @override
  List<Object?> get props => [token, platform];
}
