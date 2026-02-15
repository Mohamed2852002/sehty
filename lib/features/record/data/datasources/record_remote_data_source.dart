import 'package:dio/dio.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class RecordRemoteDataSource {
  final ApiServices apiServices;

  RecordRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getListOfMedicalRecords() async {
    return await apiServices.get(Endpoints.getListOfMedicalRecords);
  }

  Future<Map<String, dynamic>> uploadMedicalRecord({
    required String filePath,
    required String fileType,
    required String doctorName,
    required String recordDate,
    required String labName,
    required String name,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'file_type': fileType,
      'doctor_name': doctorName,
      'record_date': recordDate,
      'lab_name': labName,
      'name': name,
    });
    return await apiServices.postFormData(
      Endpoints.uploadMedicalRecord,
      formData,
    );
  }

  Future<Map<String, dynamic>> shareMedicalRecord({
    required int recordId,
  }) async {
    return await apiServices.post(Endpoints.shareMedicalRecord(recordId), {});
  }

  Future<Map<String, dynamic>> getSharedMedicalRecord({
    required String shareToken,
  }) async {
    return await apiServices.get(Endpoints.getSharedMedicalRecord(shareToken));
  }
}
