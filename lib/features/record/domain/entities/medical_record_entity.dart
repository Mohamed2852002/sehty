import 'package:equatable/equatable.dart';

class MedicalRecordEntity extends Equatable {
  final int? id;
  final String? name;
  final String? fileType;
  final String? doctorName;
  final String? labName;
  final String? recordDate;
  final String? qrCode;
  final bool? hasActiveShare;
  final DateTime? shareExpiresAt;
  final DateTime? createdAt;

  const MedicalRecordEntity({
    this.id,
    this.name,
    this.fileType,
    this.doctorName,
    this.labName,
    this.recordDate,
    this.qrCode,
    this.hasActiveShare,
    this.shareExpiresAt,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    fileType,
    doctorName,
    labName,
    recordDate,
    qrCode,
    hasActiveShare,
    shareExpiresAt,
    createdAt,
  ];
}
