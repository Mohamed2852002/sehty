import 'patient.dart';

class FamilyMemberModel {
  int? id;
  String? relationship;
  String? status;
  String? name;
  String? phone;
  int? totalToday;
  int? takenToday;
  int? untakenToday;
  int? percentage;
  DateTime? invitedAt;
  DateTime? approvedAt;
  Patient? patient;

  FamilyMemberModel({
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

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    return FamilyMemberModel(
      id: json['id'] as int?,
      relationship: json['relationship'] as String?,
      status: json['status'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      totalToday: json['total_today'] as int?,
      takenToday: json['taken_today'] as int?,
      untakenToday: json['untaken_today'] as int?,
      percentage: json['percentage'] as int?,
      invitedAt: json['invited_at'] == null
          ? null
          : DateTime.parse(json['invited_at'] as String),
      approvedAt: json['approved_at'] == null
          ? null
          : DateTime.parse(json['approved_at'] as String),
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'relationship': relationship,
    'status': status,
    'name': name,
    'phone': phone,
    'total_today': totalToday,
    'taken_today': takenToday,
    'untaken_today': untakenToday,
    'percentage': percentage,
    'invited_at': invitedAt?.toIso8601String(),
    'approved_at': approvedAt?.toIso8601String(),
    'patient': patient?.toJson(),
  };
}
