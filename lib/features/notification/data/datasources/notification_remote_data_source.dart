import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class NotificationRemoteDataSource {
  final ApiServices apiServices;

  NotificationRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getListOfNotifications() async {
    return await apiServices.get(Endpoints.getListOfNotifications);
  }

  Future<Map<String, dynamic>> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    final Map<String, dynamic> tokenData = {
      'token': token,
      'platform': platform,
    };
    return await apiServices.post(Endpoints.registerDeviceToken, tokenData);
  }
}
