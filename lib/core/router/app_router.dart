import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/utils/app_initializer.dart';
import 'package:sehty/features/auth/presentation/pages/otp_verfication_screen.dart';
import 'package:sehty/features/auth/presentation/pages/login_screen.dart';
import 'package:sehty/features/auth/presentation/pages/register_screen.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';
import 'package:sehty/main_shell/main_shell_screen.dart';
import 'package:sehty/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:sehty/core/di/injection_container.dart';

class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: AppInitializer.token != null
          ? Routes.mainShell
          : Routes.login,
      // redirect: (context, state) {
      //   final isLoggingIn = state.matchedLocation == Routes.login;
      //   if (AppInitializer.token == null) {
      //     return isLoggingIn ? null : Routes.login;
      //   }
      //   if (isLoggingIn) {
      //     return Routes.mainShell;
      //   }
      //   return null;
      // },
      routes: [
        GoRoute(path: Routes.login, builder: (_, _) => const LoginScreen()),
        GoRoute(
          path: Routes.otpVerification,
          builder: (_, state) =>
              OtpVerficationScreen(phone: state.extra as String),
        ),
        GoRoute(
          path: Routes.register,
          builder: (_, _) => const RegisterScreen(),
        ),
        GoRoute(
          path: Routes.mainShell,
          builder: (_, _) => BlocProvider.value(
            value: sl<MainShellCubit>(),
            child: const MainShellScreen(),
          ),
        ),
        GoRoute(
          path: Routes.editProfile,
          builder: (_, _) => const EditProfileScreen(),
        ),
      ],
    );
  }
}
