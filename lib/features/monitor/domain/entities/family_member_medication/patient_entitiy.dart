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
