import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/hive_helper.dart';
import 'package:sehty/features/profile/domain/entities/chronic_disease_entity.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/domain/entities/surgery_entity.dart';
import 'package:sehty/features/profile/domain/repositories/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HiveHelper _hiveHelper = HiveHelper.instance;
  final ProfileRepo profileRepo;

  static const String _boxName = 'settings';
  static const String _keyLanguage = 'language';

  ProfileBloc({required this.profileRepo}) : super(const ProfileInitial()) {
    // Language handlers
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<GetSavedLanguageEvent>(_onGetSavedLanguage);

    // Profile API handlers
    on<GetProfileEvent>(_onGetProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<AddSurgeryEvent>(_onAddSurgery);
    on<GetChronicDiseasesEvent>(_onGetChronicDiseases);
  }

  // Language handlers
  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await _hiveHelper.put(_boxName, _keyLanguage, event.locale);

    final currentState = state;
    if (currentState is ProfileLoaded) {
      emit(ProfileLoaded(profile: currentState.profile, locale: event.locale));
    } else if (currentState is ProfileUpdated) {
      emit(ProfileUpdated(profile: currentState.profile, locale: event.locale));
    } else {
      emit(LanguageChangedState(event.locale));
    }
  }

  Future<void> _onGetSavedLanguage(
    GetSavedLanguageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final String? savedLanguage = await _hiveHelper.get<String>(
      _boxName,
      _keyLanguage,
    );
    emit(LanguageChangedState(savedLanguage ?? 'ar'));
  }

  // Profile API handlers
  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading(locale: state.locale, profile: _getCurrentProfile()));
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.errorMessage,
          locale: state.locale,
          profile: _getCurrentProfile(),
        ),
      ),
      (profile) => emit(ProfileLoaded(profile: profile, locale: state.locale)),
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading(locale: state.locale, profile: _getCurrentProfile()));
    final result = await profileRepo.updateProfile(
      name: event.name,
      phone: event.phone,
      age: event.age,
      gender: event.gender,
      governorate: event.governorate,
      weight: event.weight,
      district: event.district,
      chronicDiseases: event.chronicDiseases,
    );
    result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.errorMessage,
          locale: state.locale,
          profile: _getCurrentProfile(),
        ),
      ),
      (profile) => emit(ProfileUpdated(profile: profile, locale: state.locale)),
    );
  }

  Future<void> _onAddSurgery(
    AddSurgeryEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = _getCurrentProfile();
    emit(ProfileLoading(locale: state.locale, profile: currentProfile));
    final result = await profileRepo.addSurgery(
      surgeryName: event.surgeryName,
      surgeryDate: event.surgeryDate,
    );
    result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.errorMessage,
          locale: state.locale,
          profile: currentProfile,
        ),
      ),
      (surgery) => emit(
        SurgeryAdded(
          surgery: surgery,
          profile: currentProfile,
          locale: state.locale,
        ),
      ),
    );
  }

  Future<void> _onGetChronicDiseases(
    GetChronicDiseasesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = _getCurrentProfile();
    emit(ProfileLoading(locale: state.locale, profile: currentProfile));
    final result = await profileRepo.getListOfChronicDiseases();
    result.fold(
      (failure) => emit(
        ProfileError(
          message: failure.errorMessage,
          locale: state.locale,
          profile: currentProfile,
        ),
      ),
      (diseases) => emit(
        ChronicDiseasesLoaded(
          chronicDiseases: diseases,
          profile: currentProfile,
          locale: state.locale,
        ),
      ),
    );
  }

  ProfileEntity? _getCurrentProfile() {
    final currentState = state;
    if (currentState is ProfileLoaded) return currentState.profile;
    if (currentState is ProfileUpdated) return currentState.profile;
    if (currentState is ProfileLoading) return currentState.profile;
    if (currentState is ChronicDiseasesLoaded) return currentState.profile;
    if (currentState is SurgeryAdded) return currentState.profile;
    if (currentState is ProfileError) return currentState.profile;
    return null;
  }
}
