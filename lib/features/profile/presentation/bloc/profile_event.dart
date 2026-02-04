part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguageEvent extends ProfileEvent {
  final String locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object> get props => [locale];
}

class GetSavedLanguageEvent extends ProfileEvent {}
