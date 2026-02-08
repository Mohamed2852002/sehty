import 'package:sehty/features/monitor/data/models/family_member_model/patient.dart';
import 'statistics.dart';

class FamilyMemberMedicationsModel {
  Patient? patient;
  Statistics? statistics;
  List<dynamic>? medications;

  FamilyMemberMedicationsModel({
    this.patient,
    this.statistics,
    this.medications,
  });

  factory FamilyMemberMedicationsModel.fromJson(Map<String, dynamic> json) {
    return FamilyMemberMedicationsModel(
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
      medications: json['medications'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'patient': patient?.toJson(),
    'statistics': statistics?.toJson(),
    'medications': medications,
  };
}
