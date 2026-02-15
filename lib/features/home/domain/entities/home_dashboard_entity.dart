import 'package:equatable/equatable.dart';
import 'welcome_entity.dart';
import 'family_monitoring_entity.dart';
import 'daily_summary_entity.dart';
import 'home_medication_entity.dart';

class HomeDashboardEntity extends Equatable {
  final WelcomeEntity? welcome;
  final FamilyMonitoringEntity? familyMonitoring;
  final DailySummaryEntity? dailySummary;
  final List<HomeMedicationEntity> medications;

  const HomeDashboardEntity({
    this.welcome,
    this.familyMonitoring,
    this.dailySummary,
    required this.medications,
  });

  @override
  List<Object?> get props => [
    welcome,
    familyMonitoring,
    dailySummary,
    medications,
  ];
}
