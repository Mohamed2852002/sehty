import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

Future<void> initMedicationDi() async {
 sl.registerLazySingleton<MedicationBloc>(() => MedicationBloc());
}