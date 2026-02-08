import 'package:equatable/equatable.dart';

class SurgeryEntity extends Equatable {
  final int? id;
  final String? surgeryName;
  final String? surgeryDate;
  final DateTime? createdAt;

  const SurgeryEntity({
    this.id,
    this.surgeryName,
    this.surgeryDate,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, surgeryName, surgeryDate, createdAt];
}
