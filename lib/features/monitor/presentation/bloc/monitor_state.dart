part of 'monitor_bloc.dart';

abstract class MonitorState extends Equatable {
  const MonitorState();

  @override
  List<Object?> get props => [];
}

class MonitorInitial extends MonitorState {}

class MonitorLoading extends MonitorState {}

class FamilyMemberMedicationsLoading extends MonitorState {}

class FamilyMemberInviteLoading extends MonitorState {}

class NewMemberAddingLoading extends MonitorState {}

class InvitationLoading extends MonitorState {}

class FamilyConnectionsLoaded extends MonitorState {
  final FamilyConnectionEntity members;
  final List<FamilyMemberEntity> filteredMembers;
  final bool isSearching;

  const FamilyConnectionsLoaded({
    required this.members,
    required this.filteredMembers,
    this.isSearching = false,
  });

  @override
  List<Object?> get props => [members, filteredMembers, isSearching];

  FamilyConnectionsLoaded copyWith({
    FamilyConnectionEntity? members,
    List<FamilyMemberEntity>? filteredMembers,
    bool? isSearching,
  }) {
    return FamilyConnectionsLoaded(
      members: members ?? this.members,
      filteredMembers: filteredMembers ?? this.filteredMembers,
      isSearching: isSearching ?? this.isSearching,
    );
  }
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

class FamilyMemberMedicationsError extends MonitorState {
  final String message;
  const FamilyMemberMedicationsError({required this.message});

  @override
  List<Object?> get props => [message];
}

class FamilyMemberInviteError extends MonitorState {
  final String message;
  const FamilyMemberInviteError({required this.message});

  @override
  List<Object?> get props => [message];
}

class NewMemberAddingError extends MonitorState {
  final String message;
  const NewMemberAddingError({required this.message});

  @override
  List<Object?> get props => [message];
}

class InvitationError extends MonitorState {
  final String message;
  const InvitationError({required this.message});

  @override
  List<Object?> get props => [message];
}
