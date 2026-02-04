import 'package:get_it/get_it.dart';
import 'package:sehty/core/di/core_di.dart';
import 'package:sehty/features/auth/di/auth_di.dart';
import 'package:sehty/features/medication/di/medication_di.dart';
import 'package:sehty/features/profile/di/profile_di.dart';
import 'package:sehty/main_shell/di/main_shell_di.dart';

GetIt sl = GetIt.instance;

Future<void> initDi() async {
  await initCore();
  await initAuthDi();
  await initProfileDi();
  await initMedicationDi();
  await initMainShellDi();
}
