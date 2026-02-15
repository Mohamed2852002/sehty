import 'package:equatable/equatable.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/statistics_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/patient_entitiy.dart';

class FamilyMemberMedicationsEntity extends Equatable {
  final PatientEntity? patient;
  final StatisticsEntity? statistics;
  final List<dynamic>? medications;

  const FamilyMemberMedicationsEntity({
    this.patient,
    this.statistics,
    this.medications,
  });

  @override
  List<Object?> get props => [patient, statistics, medications];
}
