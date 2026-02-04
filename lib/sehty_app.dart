import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/di/injection_container.dart';
import 'package:sehty/core/router/app_router.dart';
import 'package:sehty/core/themes/app_theme.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';
import 'generated/l10n.dart';

class SehtyApp extends StatefulWidget {
  const SehtyApp({super.key});

  @override
  State<SehtyApp> createState() => _SehtyAppState();
}

class _SehtyAppState extends State<SehtyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.create();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<AuthBloc>()),
        BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(GetSavedLanguageEvent()),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: Locale(state.locale),
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: AppTheme.appTheme,
          );
        },
      ),
    );
  }
}
