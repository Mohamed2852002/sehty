import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';
import 'package:sehty/features/medication/domain/repositories/medication_repo.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  final MedicationRepo medicationRepo;

  MedicationBloc({required this.medicationRepo}) : super(MedicationInitial()) {
    on<GetMedicationsEvent>(_onGetMedications);
    on<GetTodayMedicationsEvent>(_onGetTodayMedications);
    on<AddMedicationEvent>(_onAddMedication);
    on<ConfirmMedicationTakenEvent>(_onConfirmMedicationTaken);
  }

  Future<void> _onGetMedications(
    GetMedicationsEvent event,
    Emitter<MedicationState> emit,
  ) async {
    emit(MedicationLoading());
    final result = await medicationRepo.getListOfMedications();
    result.fold(
      (failure) => emit(MedicationError(message: failure.errorMessage)),
      (medications) => emit(MedicationsLoaded(medications: medications)),
    );
  }

  Future<void> _onGetTodayMedications(
    GetTodayMedicationsEvent event,
    Emitter<MedicationState> emit,
  ) async {
    emit(TodayMedicationLoading());
    final result = await medicationRepo.getTodayMedications();
    result.fold(
      (failure) => emit(TodayMedicationError(message: failure.errorMessage)),
      (medications) => emit(TodayMedicationsLoaded(medications: medications)),
    );
  }

  Future<void> _onAddMedication(
    AddMedicationEvent event,
    Emitter<MedicationState> emit,
  ) async {
    emit(AddMedicationLoading());
    final result = await medicationRepo.addMedication(
      name: event.name,
      dosage: event.dosage,
      totalQuantity: event.totalQuantity,
      startDate: event.startDate,
      schedules: event.schedules,
    );
    result.fold(
      (failure) => emit(AddMedicationError(message: failure.errorMessage)),
      (medication) => emit(MedicationAdded(medication: medication)),
    );
  }

  Future<void> _onConfirmMedicationTaken(
    ConfirmMedicationTakenEvent event,
    Emitter<MedicationState> emit,
  ) async {
    emit(ConfirmMedicationLoading());
    final result = await medicationRepo.confirmMedicationTaken(
      medicineId: event.medicineId,
      scheduledAt: event.scheduledAt,
    );
    result.fold(
      (failure) => emit(ConfirmMedicationError(message: failure.errorMessage)),
      (_) => emit(MedicationConfirmed()),
    );
  }
}
