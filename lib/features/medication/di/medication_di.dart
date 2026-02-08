import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/services/api_services.dart';
import 'package:sehty/features/medication/data/datasources/medication_remote_data_source.dart';
import 'package:sehty/features/medication/data/repositories/medication_repo_impl.dart';
import 'package:sehty/features/medication/domain/repositories/medication_repo.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

Future<void> initMedicationDi() async {
  sl.registerLazySingleton<MedicationRemoteDataSource>(
    () => MedicationRemoteDataSource(apiServices: sl<ApiServices>()),
  );

  sl.registerLazySingleton<MedicationRepo>(
    () => MedicationRepoImpl(
      medicationRemoteDataSource: sl<MedicationRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<MedicationBloc>(
    () => MedicationBloc(medicationRepo: sl<MedicationRepo>()),
  );
}
