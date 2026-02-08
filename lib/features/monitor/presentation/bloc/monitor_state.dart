part of 'monitor_bloc.dart';

abstract class MonitorState extends Equatable {
  const MonitorState();

  @override
  List<Object?> get props => [];
}

class MonitorInitial extends MonitorState {}

class MonitorLoading extends MonitorState {}

class FamilyConnectionsLoaded extends MonitorState {
  final List<FamilyMemberEntity> members;
  const FamilyConnectionsLoaded({required this.members});

  @override
  List<Object?> get props => [members];
}

class FamilyMemberMedicationsLoaded extends MonitorState {
  final FamilyMemberMedicationsEntity memberMedications;
  const FamilyMemberMedicationsLoaded({required this.memberMedications});

  @override
  List<Object?> get props => [memberMedications];
}

class FamilyMemberInvited extends MonitorState {
  final FamilyMemberEntity member;
  const FamilyMemberInvited({required this.member});

  @override
  List<Object?> get props => [member];
}

class NewMemberAdded extends MonitorState {
  final FamilyMemberEntity member;
  const NewMemberAdded({required this.member});

  @override
  List<Object?> get props => [member];
}

class InvitationApproved extends MonitorState {}

class MonitorError extends MonitorState {
  final String message;
  const MonitorError({required this.message});

  @override
  List<Object?> get props => [message];
}
