import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/core/services/endpoints.dart';

class MedicationRemoteDataSource {
  final ApiServices apiServices;

  MedicationRemoteDataSource({required this.apiServices});

  Future<Map<String, dynamic>> getListOfMedications() async {
    return await apiServices.get(Endpoints.getListOfMedications);
  }

  Future<Map<String, dynamic>> getTodayMedications() async {
    return await apiServices.get(Endpoints.getTodayMedications);
  }

  Future<Map<String, dynamic>> addMedication({
    required String name,
    required String dosage,
    required int totalQuantity,
    required String startDate,
    required List<Map<String, dynamic>> schedules,
  }) async {
    final Map<String, dynamic> medicationData = {
      'name': name,
      'dosage': dosage,
      'total_quantity': totalQuantity,
      'start_date': startDate,
      'schedules': schedules,
    };
    return await apiServices.post(Endpoints.addMedication, medicationData);
  }

  Future<Map<String, dynamic>> confirmMedicationTaken({
    required int medicineId,
    required String scheduledAt,
  }) async {
    final Map<String, dynamic> confirmData = {'scheduled_at': scheduledAt};
    return await apiServices.post(
      Endpoints.confirmMedicationTaken(medicineId),
      confirmData,
    );
  }
}
