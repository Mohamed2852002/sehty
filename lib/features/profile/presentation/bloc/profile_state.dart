part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final String locale;
  const ProfileState({this.locale = 'ar'});

  @override
  List<Object> get props => [locale];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial() : super();
}

class LanguageChangedState extends ProfileState {
  const LanguageChangedState(String locale) : super(locale: locale);
}
