import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/monitor/domain/entities/family_connection_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/family_member_medication_entity.dart';
import 'package:sehty/features/monitor/domain/repositories/monitor_repo.dart';

import 'package:stream_transform/stream_transform.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  final MonitorRepo monitorRepo;

  MonitorBloc({required this.monitorRepo}) : super(MonitorInitial()) {
    on<GetFamilyConnectionsEvent>(_onGetFamilyConnections);
    on<GetFamilyMemberMedicationsEvent>(_onGetFamilyMemberMedications);
    on<InviteFamilyMemberEvent>(_onInviteFamilyMember);
    on<AddNewMemberEvent>(_onAddNewMember);
    on<ApproveFamilyInvitationEvent>(_onApproveFamilyInvitation);
    on<SearchFamilyMembersEvent>(
      _onSearchFamilyMembers,
      transformer: debounce(_duration),
    );
    on<ClearSearchFamilyMemberEvent>(_onClearSearchFamilyMember);
  }

  Future<void> _onSearchFamilyMembers(
    SearchFamilyMembersEvent event,
    Emitter<MonitorState> emit,
  ) async {
    if (state is FamilyConnectionsLoaded) {
      final currentState = state as FamilyConnectionsLoaded;
      emit(currentState.copyWith(isSearching: true));
      await Future.delayed(const Duration(milliseconds: 500));
      final query = event.query.toLowerCase();
      final filteredList = currentState.members.familyMembers
          .where(
            (member) =>
                (member.name ?? '').toLowerCase().contains(query) ||
                (member.phone ?? '').contains(query),
          )
          .toList();
      emit(
        currentState.copyWith(
          filteredMembers: filteredList,
          isSearching: false,
        ),
      );
    }
  }

  Future<void> _onClearSearchFamilyMember(
    ClearSearchFamilyMemberEvent event,
    Emitter<MonitorState> emit,
  ) async {
    if (state is FamilyConnectionsLoaded) {
      final currentState = state as FamilyConnectionsLoaded;
      emit(
        FamilyConnectionsLoaded(
          members: currentState.members,
          filteredMembers: currentState.members.familyMembers,
        ),
      );
    }
  }

  Future<void> _onGetFamilyConnections(
    GetFamilyConnectionsEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.getListOfFamilyConnections();
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (familyConnection) => emit(
        FamilyConnectionsLoaded(
          members: familyConnection,
          filteredMembers: familyConnection.familyMembers,
        ),
      ),
    );
  }

  Future<void> _onGetFamilyMemberMedications(
    GetFamilyMemberMedicationsEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(FamilyMemberMedicationsLoading());
    final result = await monitorRepo.showOneFamilyMedication(
      memberId: event.memberId,
    );
    result.fold(
      (failure) =>
          emit(FamilyMemberMedicationsError(message: failure.errorMessage)),
      (memberMedications) => emit(
        FamilyMemberMedicationsLoaded(memberMedications: memberMedications),
      ),
    );
  }

  Future<void> _onInviteFamilyMember(
    InviteFamilyMemberEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(FamilyMemberInviteLoading());
    final result = await monitorRepo.inviteFamilyMember(
      phone: event.phone,
      relationship: event.relationship,
    );
    result.fold(
      (failure) => emit(FamilyMemberInviteError(message: failure.errorMessage)),
      (member) => emit(FamilyMemberInvited(member: member)),
    );
  }

  Future<void> _onAddNewMember(
    AddNewMemberEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(NewMemberAddingLoading());
    final result = await monitorRepo.addNewMember(
      name: event.name,
      phone: event.phone,
      relationship: event.relationship,
    );
    result.fold(
      (failure) => emit(NewMemberAddingError(message: failure.errorMessage)),
      (member) => emit(NewMemberAdded(member: member)),
    );
  }

  Future<void> _onApproveFamilyInvitation(
    ApproveFamilyInvitationEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(InvitationLoading());
    final result = await monitorRepo.approveFamilyInvitation(
      invitationId: event.invitationId,
    );
    result.fold(
      (failure) => emit(InvitationError(message: failure.errorMessage)),
      (_) => emit(InvitationApproved()),
    );
  }
}
