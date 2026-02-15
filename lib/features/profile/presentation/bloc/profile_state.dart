part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final String locale;
  const ProfileState({this.locale = 'ar'});

  @override
  List<Object?> get props => [locale];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super();
}

// Language states
class LanguageChangedState extends ProfileState {
  const LanguageChangedState(String locale) : super(locale: locale);
}

// Profile API states
class ProfileLoading extends ProfileState {
  final ProfileEntity? profile;
  const ProfileLoading({super.locale, this.profile});

  @override
  List<Object?> get props => [locale, profile];
}

class ProfileLoaded extends ProfileState {
  final ProfileEntity profile;
  const ProfileLoaded({required this.profile, super.locale});

  @override
  List<Object?> get props => [profile, locale];
}

class ProfileUpdated extends ProfileState {
  final ProfileEntity profile;
  const ProfileUpdated({required this.profile, super.locale});

  @override
  List<Object?> get props => [profile, locale];
}

class SurgeryAdded extends ProfileState {
  final SurgeryEntity surgery;
  final ProfileEntity? profile;
  const SurgeryAdded({required this.surgery, this.profile, super.locale});

  @override
  List<Object?> get props => [surgery, profile, locale];
}

class ChronicDiseasesLoaded extends ProfileState {
  final List<ChronicDiseaseEntity> chronicDiseases;
  final ProfileEntity? profile;
  const ChronicDiseasesLoaded({
    required this.chronicDiseases,
    this.profile,
    super.locale,
  });

  @override
  List<Object?> get props => [chronicDiseases, profile, locale];
}

class ProfileError extends ProfileState {
  final String message;
  final ProfileEntity? profile;
  const ProfileError({required this.message, this.profile, super.locale});

  @override
  List<Object?> get props => [message, profile, locale];
}
