import 'package:equatable/equatable.dart';
import 'home_member_entity.dart';

class FamilyMonitoringEntity extends Equatable {
  final int count;
  final String message;
  final List<HomeMemberEntity> members;

  const FamilyMonitoringEntity({
    required this.count,
    required this.message,
    required this.members,
  });

  @override
  List<Object?> get props => [count, message, members];
}
