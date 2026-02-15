import 'package:sehty/features/home/domain/entities/home_dashboard_entity.dart';
import 'daily_summary.dart';
import 'family_monitoring.dart';
import 'medication.dart';
import 'welcome.dart';

class HomeDashboardModel {
  Welcome? welcome;
  FamilyMonitoring? familyMonitoring;
  DailySummary? dailySummary;
  List<Medication>? medications;

  HomeDashboardModel({
    this.welcome,
    this.familyMonitoring,
    this.dailySummary,
    this.medications,
  });

  factory HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    return HomeDashboardModel(
      welcome: json['welcome'] == null
          ? null
          : Welcome.fromJson(json['welcome'] as Map<String, dynamic>),
      familyMonitoring: json['family_monitoring'] == null
          ? null
          : FamilyMonitoring.fromJson(
              json['family_monitoring'] as Map<String, dynamic>,
            ),
      dailySummary: json['daily_summary'] == null
          ? null
          : DailySummary.fromJson(
              json['daily_summary'] as Map<String, dynamic>,
            ),
      medications: (json['medications'] as List<dynamic>?)
          ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'welcome': welcome?.toJson(),
    'family_monitoring': familyMonitoring?.toJson(),
    'daily_summary': dailySummary?.toJson(),
    'medications': medications?.map((e) => e.toJson()).toList(),
  };

  HomeDashboardEntity toEntity() => HomeDashboardEntity(
    welcome: welcome?.toEntity(),
    familyMonitoring: familyMonitoring?.toEntity(),
    dailySummary: dailySummary?.toEntity(),
    medications: medications?.map((e) => e.toEntity()).toList() ?? [],
  );
}
