import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

class ListenToTokenRefreshUseCase {
  final NotificationRepo notificationRepo;

  ListenToTokenRefreshUseCase({required this.notificationRepo});

  Stream<String> call() {
    return notificationRepo.onTokenRefresh;
  }
}
