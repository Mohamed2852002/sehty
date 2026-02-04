import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/features/auth/presentation/pages/otp_verfication_screen.dart';
import 'package:sehty/features/auth/presentation/pages/login_screen.dart';
import 'package:sehty/features/auth/presentation/pages/register_screen.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';
import 'package:sehty/main_shell/main_shell_screen.dart';

class AppRouter {
  static GoRouter create() {
    return GoRouter(
      initialLocation: Routes.login,
      // redirect: (context, state) {
      //   if (!authCubit.isLoggedIn &&
      //       state.location != Routes.login) {
      //     return Routes.login;
      //   }
      //   return null;
      // },
      routes: [
        GoRoute(
          path: Routes.login,
          builder: (_, _) => const LoginScreen(),
        ),
        GoRoute(
          path: Routes.otpVerification,
          builder: (_, _) => const OtpVerficationScreen(),
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
      ],
    );
  }
}
