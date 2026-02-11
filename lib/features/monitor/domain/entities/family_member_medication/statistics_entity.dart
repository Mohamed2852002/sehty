import 'package:equatable/equatable.dart';

class StatisticsEntity extends Equatable {
  final int? totalToday;
  final int? takenToday;
  final int? untakenToday;
  final int? percentage;

  const StatisticsEntity({
    this.totalToday,
    this.takenToday,
    this.untakenToday,
    this.percentage,
  });

  @override
  List<Object?> get props => [totalToday, takenToday, untakenToday, percentage];
}