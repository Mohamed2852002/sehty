import 'package:sehty/features/home/domain/entities/family_monitoring_entity.dart';

import 'member.dart';

class FamilyMonitoring {
  int? count;
  String? message;
  List<Member>? members;

  FamilyMonitoring({this.count, this.message, this.members});

  factory FamilyMonitoring.fromJson(Map<String, dynamic> json) {
    return FamilyMonitoring(
      count: json['count'] as int?,
      message: json['message'] as String?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'message': message,
    'members': members?.map((e) => e.toJson()).toList(),
  };

  FamilyMonitoringEntity toEntity() => FamilyMonitoringEntity(
    count: count ?? 0,
    message: message ?? '',
    members: members?.map((e) => e.toEntity()).toList() ?? [],
  );
}
