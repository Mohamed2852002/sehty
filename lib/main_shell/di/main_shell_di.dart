import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';

Future<void> initMainShellDi() async {
  sl.registerLazySingleton(() => MainShellCubit());
}