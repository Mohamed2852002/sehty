import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class AuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> sendLoginOtp({required String phone}) async {
    final Map<String, dynamic> otpInfo = {'phone': phone};
    return await apiServices.post(Endpoints.login, otpInfo);
  }

  Future<Map<String, dynamic>> login({
    required String phone,
    String? otp,
  }) async {
    final Map<String, dynamic> loginInfo = {'phone': phone, 'otp': otp};
    return await apiServices.post(Endpoints.login, loginInfo);
  }

  Future<Map<String, dynamic>> sendRegisterOtp({required String phone}) async {
    final Map<String, dynamic> otpInfo = {'phone': phone};
    return await apiServices.post(Endpoints.register, otpInfo);
  }

  Future<Map<String, dynamic>> register({
    required String phone,
    required String name,
    required String otp,
    required int age,
    required String gender,
    required double weight,
    required String governorate,
    required String district,
    required List<int> chronicDiseases,
    required bool dataSharingConsent,
  }) async {
    final Map<String, dynamic> registerInfo = {
      "name": name,
      "phone": phone,
      "otp": otp,
      "age": age,
      "gender": gender,
      "weight": weight,
      "governorate": governorate,
      "district": district,
      "chronic_diseases": chronicDiseases,
      "data_sharing_consent": dataSharingConsent,
    };
    return await apiServices.post(Endpoints.register, registerInfo);
  }

  Future<Map<String, dynamic>> logout() async {
    return await apiServices.post(Endpoints.logout, {});
  }
}
