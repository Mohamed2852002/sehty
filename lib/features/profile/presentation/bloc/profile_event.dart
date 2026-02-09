part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

// Language events
class ChangeLanguageEvent extends ProfileEvent {
  final String locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}

class GetSavedLanguageEvent extends ProfileEvent {}

// Profile API events
class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String phone;
  final int age;
  final String gender;
  final String governorate;
  final double weight;
  final String district;
  final List<int> chronicDiseases;

  const UpdateProfileEvent({
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.governorate,
    required this.weight,
    required this.district,
    required this.chronicDiseases,
  });

  @override
  List<Object?> get props => [
    name,
    phone,
    age,
    gender,
    governorate,
    weight,
    district,
    chronicDiseases,
  ];
}

class AddSurgeryEvent extends ProfileEvent {
  final String surgeryName;
  final String surgeryDate;

  const AddSurgeryEvent({required this.surgeryName, required this.surgeryDate});

  @override
  List<Object?> get props => [surgeryName, surgeryDate];
}

class GetChronicDiseasesEvent extends ProfileEvent {}
