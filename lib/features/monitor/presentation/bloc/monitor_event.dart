part of 'monitor_bloc.dart';

abstract class MonitorEvent extends Equatable {
  const MonitorEvent();

  @override
  List<Object?> get props => [];
}

class GetFamilyConnectionsEvent extends MonitorEvent {}

class GetFamilyMemberMedicationsEvent extends MonitorEvent {
  final int memberId;
  const GetFamilyMemberMedicationsEvent({required this.memberId});

  @override
  List<Object?> get props => [memberId];
}

class InviteFamilyMemberEvent extends MonitorEvent {
  final String phone;
  final String relationship;

  const InviteFamilyMemberEvent({
    required this.phone,
    required this.relationship,
  });

  @override
  List<Object?> get props => [phone, relationship];
}

class AddNewMemberEvent extends MonitorEvent {
  final String name;
  final String phone;
  final String relationship;

  const AddNewMemberEvent({
    required this.name,
    required this.phone,
    required this.relationship,
  });

  @override
  List<Object?> get props => [name, phone, relationship];
}

class ApproveFamilyInvitationEvent extends MonitorEvent {
  final int invitationId;
  const ApproveFamilyInvitationEvent({required this.invitationId});

  @override
  List<Object?> get props => [invitationId];
}

class SearchFamilyMembersEvent extends MonitorEvent {
  final String query;
  const SearchFamilyMembersEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class ClearSearchFamilyMemberEvent extends MonitorEvent {
  const ClearSearchFamilyMemberEvent();
}
