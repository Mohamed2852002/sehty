import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getHomeDashboard() async {
    return await apiServices.get(Endpoints.homeDashboard);
  }
}
