part of 'medication_bloc.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();  

  @override
  List<Object> get props => [];
}
class MedicationInitial extends MedicationState {}
