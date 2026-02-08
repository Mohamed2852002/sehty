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
  const ProfileLoading({super.locale});
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
  const SurgeryAdded({required this.surgery, super.locale});

  @override
  List<Object?> get props => [surgery, locale];
}

class ChronicDiseasesLoaded extends ProfileState {
  final List<ChronicDiseaseEntity> chronicDiseases;
  const ChronicDiseasesLoaded({required this.chronicDiseases, super.locale});

  @override
  List<Object?> get props => [chronicDiseases, locale];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message, super.locale});

  @override
  List<Object?> get props => [message, locale];
}
