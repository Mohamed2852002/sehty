import 'package:equatable/equatable.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/patient_entitiy.dart';

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
