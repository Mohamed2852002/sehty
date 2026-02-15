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
    required List<String> schedules,
  }) async {
    // Calculate the days of the week (1=Sat .. 7=Fri) from startDate
    List<int> days = [];
    try {
      final start = DateTime.parse(startDate);
      final Set<int> daySet = {};
      for (int i = 0; i < totalQuantity && daySet.length < 7; i++) {
        final date = start.add(Duration(days: i));
        // Dart weekday: Mon=1..Sun=7 → Backend: Sat=1..Fri=7
        final backendDay = ((date.weekday + 1) % 7) + 1;
        daySet.add(backendDay);
      }
      days = daySet.toList()..sort();
    } catch (e) {
      days = [1, 2, 3, 4, 5, 6, 7];
    }

    final List<Map<String, dynamic>> scheduleMaps = schedules
        .map<Map<String, dynamic>>(
          (time) => {'time': time, 'days': List<int>.from(days)},
        )
        .toList();

    final Map<String, dynamic> medicationData = {
      'name': name,
      'dosage': dosage,
      'total_quantity': totalQuantity,
      'start_date': startDate,
      'schedules': scheduleMaps,
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
