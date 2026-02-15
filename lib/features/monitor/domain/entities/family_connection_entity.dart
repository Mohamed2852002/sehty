import 'package:equatable/equatable.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';

class FamilyConnectionEntity extends Equatable {
  final List<FamilyMemberEntity> familyMembers;
  final ConnectionStatisticsEntity statistics;

  const FamilyConnectionEntity({
    required this.familyMembers,
    required this.statistics,
  });

  @override
  List<Object?> get props => [familyMembers, statistics];
}

class ConnectionStatisticsEntity extends Equatable {
  final int total;
  final int approved;
  final int pending;

  const ConnectionStatisticsEntity({
    required this.total,
    required this.approved,
    required this.pending,
  });

  @override
  List<Object?> get props => [total, approved, pending];
}
