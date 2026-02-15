import 'package:equatable/equatable.dart';

class HomeMedicationEntity extends Equatable {
  final int id;
  final String name;
  final String time;
  final bool isTaken;

  const HomeMedicationEntity({
    required this.id,
    required this.name,
    required this.time,
    required this.isTaken,
  });

  @override
  List<Object?> get props => [id, name, time, isTaken];
}
