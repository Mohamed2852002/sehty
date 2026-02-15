import 'package:equatable/equatable.dart';

class MedicationScheduleEntity extends Equatable {
  final int? id;
  final String? time;
  final List<int>? daysOfWeek;

  const MedicationScheduleEntity({this.id, this.time, this.daysOfWeek});

  @override
  List<Object?> get props => [id, time, daysOfWeek];
}
