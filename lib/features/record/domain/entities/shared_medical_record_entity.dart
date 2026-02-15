import 'package:equatable/equatable.dart';
import 'medical_record_entity.dart';

class SharedMedicalRecordEntity extends Equatable {
  final MedicalRecordEntity? record;
  final String? fileUrl;

  const SharedMedicalRecordEntity({this.record, this.fileUrl});

  @override
  List<Object?> get props => [record, fileUrl];
}
