import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/address_form.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/basic_info_form.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/edit_chronic_diseases_section.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/edit_profile_app_bar.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/patient_code_card.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/privacy_footer_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late final TextEditingController _phoneController;
  late final TextEditingController _weightController;
  late final TextEditingController _districtController;
  late final TextEditingController _governorateController;

  String _gender = '';
  List<int> _selectedChronicDiseases = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _phoneController = TextEditingController();
    _weightController = TextEditingController();
    _districtController = TextEditingController();
    _governorateController = TextEditingController();

    // Load current profile data and chronic diseases list
    final profileBloc = context.read<ProfileBloc>();
    _initializeData(profileBloc.state);
    profileBloc.add(GetChronicDiseasesEvent());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _weightController.dispose();
    _districtController.dispose();
    _governorateController.dispose();
    super.dispose();
  }

  void _initializeData(ProfileState state) {
    if (state is ProfileLoaded) {
      _setProfileData(state.profile);
    } else if (state is ProfileUpdated) {
      _setProfileData(state.profile);
    }
  }

  void _setProfileData(ProfileEntity profile) {
    _nameController.text = profile.name ?? '';
    _ageController.text = profile.age?.toString() ?? '0';
    _phoneController.text = profile.phone ?? '';
    _weightController.text = profile.weight?.toString() ?? '0.0';
    _districtController.text = profile.district ?? '';
    _governorateController.text = profile.governorate ?? '';
    _gender = profile.gender ?? '';
    _selectedChronicDiseases =
        profile.chronicDiseases?.map((e) => e.id ?? 0).toList() ?? [];
  }

  void _onSave() {
    _formKey.currentState?.save();
    context.read<ProfileBloc>().add(
      UpdateProfileEvent(
        name: _nameController.text,
        phone: _phoneController.text,
        age: int.tryParse(_ageController.text) ?? 0,
        gender: _gender.toLowerCase(),
        governorate: _governorateController.text,
        weight: double.tryParse(_weightController.text) ?? 0.0,
        district: _districtController.text,
        chronicDiseases: _selectedChronicDiseases,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          setState(() => _isLoading = true);
        } else {
          setState(() => _isLoading = false);
        }

        if (state is ProfileUpdated) {
          AppFunctions.showCustomSnackBar(
            context,
            context.l10n.save,
            backgroundColor: Colors.green,
          );
          context.pop();
        }

        if (state is ProfileError) {
          AppFunctions.showCustomSnackBar(
            context,
            state.message,
            backgroundColor: Colors.red,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  EditProfileAppBar(isLoading: _isLoading, onSave: _onSave),

                  // Content
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 24),
                      const PatientCodeCard(),
                      const SizedBox(height: 24),

                      BasicInfoForm(
                        nameController: _nameController,
                        ageController: _ageController,
                        initialGender: _gender,
                        weightController: _weightController,
                        phoneController: _phoneController,
                        onGenderChanged: (val) => _gender = val ?? '',
                      ),
                      const SizedBox(height: 16),

                      AddressForm(
                        governorateController: _governorateController,
                        districtController: _districtController,
                      ),
                      const SizedBox(height: 16),

                      EditChronicDiseasesSection(
                        initialSelectedDiseases: _selectedChronicDiseases,
                        onSelectionChanged: (selectedIds) {
                          _selectedChronicDiseases = selectedIds;
                        },
                      ),
                      const SizedBox(height: 24),

                      const PrivacyFooterWidget(),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
