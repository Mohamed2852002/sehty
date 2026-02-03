import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> initAuthDi() async {
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
}
