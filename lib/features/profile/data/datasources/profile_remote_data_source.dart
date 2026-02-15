import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class ProfileRemoteDataSource {
  final ApiServices apiServices;

  ProfileRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getProfile() async {
    return await apiServices.get(Endpoints.getProfile);
  }

  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String phone,
    required int age,
    required String gender,
    required String governorate,
    required double weight,
    required String district,
    required List<int> chronicDiseases,
  }) async {
    final Map<String, dynamic> profileData = {
      'name': name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'governorate': governorate,
      'weight': weight,
      'district': district,
      'chronic_diseases': chronicDiseases,
    };
    return await apiServices.put(Endpoints.updateProfile, profileData);
  }

  Future<Map<String, dynamic>> addSurgery({
    required String surgeryName,
    required String surgeryDate,
  }) async {
    final Map<String, dynamic> surgeryData = {
      'surgery_name': surgeryName,
      'surgery_date': surgeryDate,
    };
    return await apiServices.post(Endpoints.addSurgery, surgeryData);
  }

  Future<Map<String, dynamic>> getListOfChronicDiseases() async {
    return await apiServices.get(Endpoints.getListOfChronicDiseases);
  }
}
