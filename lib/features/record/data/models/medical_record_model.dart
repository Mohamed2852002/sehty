import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';

class MedicalRecordModel {
  int? id;
  String? name;
  String? fileType;
  String? doctorName;
  String? labName;
  String? recordDate;
  String? qrCode;
  bool? hasActiveShare;
  DateTime? shareExpiresAt;
  DateTime? createdAt;

  MedicalRecordModel({
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

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fileType: json['file_type'] as String?,
      doctorName: json['doctor_name'] as String?,
      labName: json['lab_name'] as String?,
      recordDate: json['record_date'] as String?,
      qrCode: json['qr_code'] as String?,
      hasActiveShare: json['has_active_share'] as bool?,
      shareExpiresAt: json['share_expires_at'] == null
          ? null
          : DateTime.parse(json['share_expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'file_type': fileType,
    'doctor_name': doctorName,
    'lab_name': labName,
    'record_date': recordDate,
    'qr_code': qrCode,
    'has_active_share': hasActiveShare,
    'share_expires_at': shareExpiresAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
  };

  MedicalRecordEntity toEntity() {
    return MedicalRecordEntity(
      id: id,
      name: name,
      fileType: fileType,
      doctorName: doctorName,
      labName: labName,
      recordDate: recordDate,
      qrCode: qrCode,
      hasActiveShare: hasActiveShare,
      shareExpiresAt: shareExpiresAt,
      createdAt: createdAt,
    );
  }
}
