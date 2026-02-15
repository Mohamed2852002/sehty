import 'package:equatable/equatable.dart';

class DailySummaryEntity extends Equatable {
  final int total;
  final int taken;
  final int untaken;
  final bool isComplete;

  const DailySummaryEntity({
    required this.total,
    required this.taken,
    required this.untaken,
    required this.isComplete,
  });

  @override
  List<Object?> get props => [total, taken, untaken, isComplete];
}
