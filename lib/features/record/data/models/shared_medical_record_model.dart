import 'package:sehty/features/record/data/models/medical_record_model.dart';
import 'package:sehty/features/record/domain/entities/shared_medical_record_entity.dart';

class SharedMedicalRecordModel {
  MedicalRecordModel? record;
  String? fileUrl;

  SharedMedicalRecordModel({this.record, this.fileUrl});

  @override
  String toString() {
    return 'SharedMedicalRecordModel(record: $record, fileUrl: $fileUrl)';
  }

  factory SharedMedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return SharedMedicalRecordModel(
      record: json['record'] == null
          ? null
          : MedicalRecordModel.fromJson(json['record'] as Map<String, dynamic>),
      fileUrl: json['file_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'record': record?.toJson(),
    'file_url': fileUrl,
  };

  SharedMedicalRecordEntity toEntity() {
    return SharedMedicalRecordEntity(
      record: record?.toEntity(),
      fileUrl: fileUrl,
    );
  }
}
