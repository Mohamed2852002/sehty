import 'package:equatable/equatable.dart';

class PatientEntity extends Equatable {
  final int? id;
  final String? name;
  final String? patientCode;
  final String? phone;

  const PatientEntity({this.id, this.name, this.patientCode, this.phone});

  @override
  List<Object?> get props => [id, name, patientCode, phone];
}

class StatisticsEntity extends Equatable {
  final int? totalToday;
  final int? takenToday;
  final int? untakenToday;
  final int? percentage;

  const StatisticsEntity({
    this.totalToday,
    this.takenToday,
    this.untakenToday,
    this.percentage,
  });

  @override
  List<Object?> get props => [totalToday, takenToday, untakenToday, percentage];
}

class FamilyMemberEntity extends Equatable {
  final int? id;
  final String? relationship;
  final String? status;
  final String? name;
  final String? phone;
  final int? totalToday;
  final int? takenToday;
  final int? untakenToday;
  final int? percentage;
  final DateTime? invitedAt;
  final DateTime? approvedAt;
  final PatientEntity? patient;

  const FamilyMemberEntity({
    this.id,
    this.relationship,
    this.status,
    this.name,
    this.phone,
    this.totalToday,
    this.takenToday,
    this.untakenToday,
    this.percentage,
    this.invitedAt,
    this.approvedAt,
    this.patient,
  });

  @override
  List<Object?> get props => [
    id,
    relationship,
    status,
    name,
    phone,
    totalToday,
    takenToday,
    untakenToday,
    percentage,
    invitedAt,
    approvedAt,
    patient,
  ];
}

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
