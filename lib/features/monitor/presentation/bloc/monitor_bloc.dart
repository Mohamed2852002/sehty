import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/family_member_medication_entity.dart';
import 'package:sehty/features/monitor/domain/repositories/monitor_repo.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  final MonitorRepo monitorRepo;

  MonitorBloc({required this.monitorRepo}) : super(MonitorInitial()) {
    on<GetFamilyConnectionsEvent>(_onGetFamilyConnections);
    on<GetFamilyMemberMedicationsEvent>(_onGetFamilyMemberMedications);
    on<InviteFamilyMemberEvent>(_onInviteFamilyMember);
    on<AddNewMemberEvent>(_onAddNewMember);
    on<ApproveFamilyInvitationEvent>(_onApproveFamilyInvitation);
  }

  Future<void> _onGetFamilyConnections(
    GetFamilyConnectionsEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.getListOfFamilyConnections();
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (members) => emit(FamilyConnectionsLoaded(members: members)),
    );
  }

  Future<void> _onGetFamilyMemberMedications(
    GetFamilyMemberMedicationsEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.showOneFamilyMedication(
      memberId: event.memberId,
    );
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (memberMedications) => emit(
        FamilyMemberMedicationsLoaded(memberMedications: memberMedications),
      ),
    );
  }

  Future<void> _onInviteFamilyMember(
    InviteFamilyMemberEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.inviteFamilyMember(
      phone: event.phone,
      relationship: event.relationship,
    );
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (member) => emit(FamilyMemberInvited(member: member)),
    );
  }

  Future<void> _onAddNewMember(
    AddNewMemberEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.addNewMember(
      name: event.name,
      phone: event.phone,
      relationship: event.relationship,
    );
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (member) => emit(NewMemberAdded(member: member)),
    );
  }

  Future<void> _onApproveFamilyInvitation(
    ApproveFamilyInvitationEvent event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());
    final result = await monitorRepo.approveFamilyInvitation(
      invitationId: event.invitationId,
    );
    result.fold(
      (failure) => emit(MonitorError(message: failure.errorMessage)),
      (_) => emit(InvitationApproved()),
    );
  }
}
