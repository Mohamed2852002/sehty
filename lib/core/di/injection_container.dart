import 'package:get_it/get_it.dart';
import 'package:sehty/core/di/core_di.dart';
import 'package:sehty/features/auth/di/auth_di.dart';
import 'package:sehty/features/home/di/home_di.dart';
import 'package:sehty/features/medication/di/medication_di.dart';
import 'package:sehty/features/monitor/di/monitor_di.dart';
import 'package:sehty/features/notification/di/notification_di.dart';
import 'package:sehty/features/profile/di/profile_di.dart';
import 'package:sehty/features/record/di/record_di.dart';
import 'package:sehty/main_shell/di/main_shell_di.dart';

GetIt sl = GetIt.instance;

Future<void> initDi() async {
  await initCore();
  await initAuthDi();
  await initHomeDi();
  await initNotificationDi();
  await initRecordDi();
  await initMonitorDi();
  await initProfileDi();
  await initMedicationDi();
  await initMainShellDi();
}
