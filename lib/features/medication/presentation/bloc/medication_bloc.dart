import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc() : super(MedicationInitial()) {
    on<MedicationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
