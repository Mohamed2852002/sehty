import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/router/app_router.dart';
import 'package:sehty/core/themes/app_theme.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class SehtyApp extends StatelessWidget {
  const SehtyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: MaterialApp.router(
        builder: (context, child) {
          AppStrings.load(context);
          return child!;
        },
        routerConfig: AppRouter.create(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.appTheme,
      ),
    );
  }
}
