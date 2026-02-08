part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SendLoginOtpEvent extends AuthEvent {
  final String phone;
  const SendLoginOtpEvent({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String otp;
  const LoginEvent({required this.phone, required this.otp});

  @override
  List<Object?> get props => [phone, otp];
}

class SendRegisterOtpEvent extends AuthEvent {
  final String phone;
  const SendRegisterOtpEvent({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class RegisterEvent extends AuthEvent {
  final String phone;
  final String name;
  final String otp;
  final int age;
  final String gender;
  final double weight;
  final String governorate;
  final String district;
  final List<int> chronicDiseases;
  final bool dataSharingConsent;

  const RegisterEvent({
    required this.phone,
    required this.name,
    required this.otp,
    required this.age,
    required this.gender,
    required this.weight,
    required this.governorate,
    required this.district,
    required this.chronicDiseases,
    required this.dataSharingConsent,
  });

  @override
  List<Object?> get props => [
    phone,
    name,
    otp,
    age,
    gender,
    weight,
    governorate,
    district,
    chronicDiseases,
    dataSharingConsent,
  ];
}

class LogoutEvent extends AuthEvent {}
