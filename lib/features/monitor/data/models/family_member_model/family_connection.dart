import 'package:sehty/features/monitor/data/models/family_member_model/family_member_model.dart';
import 'package:sehty/features/monitor/domain/entities/family_connection_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';

class FamilyConnection {
  final List<FamilyMemberModel> familyMembers;
  final ConnectionStatistics statistics;

  FamilyConnection({required this.familyMembers, required this.statistics});

  factory FamilyConnection.fromJson(Map<String, dynamic> json) {
    return FamilyConnection(
      familyMembers: List<FamilyMemberModel>.from(
        (json['monitoring'] as List).map(
          (x) => FamilyMemberModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      statistics: ConnectionStatistics.fromJson(
        json['statistics'] as Map<String, dynamic>,
      ),
    );
  }

  FamilyConnectionEntity toEntity(
    FamilyMemberEntity Function(FamilyMemberModel) mapper,
  ) {
    return FamilyConnectionEntity(
      familyMembers: familyMembers.map((m) => mapper(m)).toList(),
      statistics: statistics.toEntity(),
    );
  }
}

class ConnectionStatistics {
  final int total;
  final int approved;
  final int pending;

  ConnectionStatistics({
    required this.total,
    required this.approved,
    required this.pending,
  });

  factory ConnectionStatistics.fromJson(Map<String, dynamic> json) {
    final monitoring = json['monitoring'] as Map<String, dynamic>? ?? {};
    return ConnectionStatistics(
      total: monitoring['total'] as int? ?? 0,
      approved: monitoring['approved'] as int? ?? 0,
      pending: monitoring['pending'] as int? ?? 0,
    );
  }

  ConnectionStatisticsEntity toEntity() {
    return ConnectionStatisticsEntity(
      total: total,
      approved: approved,
      pending: pending,
    );
  }
}
