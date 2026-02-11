import 'log.dart';
import 'schedule.dart';

class MedicationModel {
  int? id;
  String? name;
  String? dosage;
  int? totalQuantity;
  int? remainingQuantity;
  double? percentage;
  String? startDate;
  DateTime? endDate;
  bool? isActive;
  dynamic notes;
  List<Schedule>? schedules;
  List<Log>? logs;
  DateTime? createdAt;

  MedicationModel({
    this.id,
    this.name,
    this.dosage,
    this.totalQuantity,
    this.remainingQuantity,
    this.percentage,
    this.startDate,
    this.endDate,
    this.isActive,
    this.notes,
    this.schedules,
    this.logs,
    this.createdAt,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        dosage: json['dosage'] as String?,
        totalQuantity: json['total_quantity'] as int?,
        remainingQuantity: json['remaining_quantity'] as int?,
        percentage: (json['percentage'] as num?)?.toDouble(),
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] == null
            ? null
            : DateTime.parse(json['end_date'] as String),
        isActive: json['is_active'] as bool?,
        notes: json['notes'] as dynamic,
        schedules: (json['schedules'] as List<dynamic>?)
            ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
            .toList(),
        logs: (json['logs'] as List<dynamic>?)
            ?.map((e) => Log.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'dosage': dosage,
    'total_quantity': totalQuantity,
    'remaining_quantity': remainingQuantity,
    'percentage': percentage,
    'start_date': startDate,
    'end_date': endDate?.toIso8601String(),
    'is_active': isActive,
    'notes': notes,
    'schedules': schedules?.map((e) => e.toJson()).toList(),
    'logs': logs?.map((e) => e.toJson()).toList(),
    'created_at': createdAt?.toIso8601String(),
  };
}
