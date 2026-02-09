import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/logout_button.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/language_switcher_widget.dart';
import 'package:sehty/features/profile/presentation/widgets/patient_code_card.dart';
import 'package:sehty/features/profile/presentation/widgets/privacy_note_widget.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/profile_header.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/address_information_section.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/basic_information_section.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_screen_widgets/profile_chronic_diseases_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  Future<void> _onRefresh() async {
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              context.go(Routes.login);
            }
            if (state is AuthFailure) {
              AppFunctions.showCustomSnackBar(
                context,
                state.message,
                backgroundColor: Colors.red,
              );
            }
          },
        ),
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              AppFunctions.showCustomSnackBar(
                context,
                state.message,
                backgroundColor: Colors.red,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is ProfileLoading ||
              current is ProfileLoaded ||
              current is ProfileUpdated ||
              current is ChronicDiseasesLoaded ||
              current is SurgeryAdded ||
              current is ProfileError,
          builder: (context, state) {
            ProfileEntity? profile;
            if (state is ProfileLoaded) {
              profile = state.profile;
            } else if (state is ProfileUpdated) {
              profile = state.profile;
            } else if (state is ProfileLoading) {
              profile = state.profile;
            } else if (state is ChronicDiseasesLoaded) {
              profile = state.profile;
            } else if (state is SurgeryAdded) {
              profile = state.profile;
            } else if (state is ProfileError) {
              profile = state.profile;
            }
            if (state is ProfileLoading && profile == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (profile == null && state is! ProfileError) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError && profile == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _onRefresh,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProfileHeader(),
                        PatientCodeCard(
                          patientCode: profile?.patientCode ?? context.l10n.n_a,
                        ),
                        const LanguageSwitcherWidget(),
                        BasicInformationSection(profile: profile),
                        AddressInformationSection(profile: profile),
                        ProfileChronicDiseasesSection(profile: profile),
                        const LogoutButton(),
                        const PrivacyNoteWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
