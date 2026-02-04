import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';

Future<void> initProfileDi() async {
  sl.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
}
