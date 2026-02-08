import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/auth/domain/entities/user_entity.dart';
import 'package:sehty/features/auth/domain/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<SendLoginOtpEvent>(_onSendLoginOtp);
    on<LoginEvent>(_onLogin);
    on<SendRegisterOtpEvent>(_onSendRegisterOtp);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onSendLoginOtp(
    SendLoginOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.sendLoginOtp(phone: event.phone);
    result.fold(
      (failure) => emit(AuthFailure(message: failure.errorMessage)),
      (_) => emit(AuthOtpSentSuccessfully()),
    );
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.login(phone: event.phone, otp: event.otp);
    result.fold(
      (failure) => emit(AuthFailure(message: failure.errorMessage)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> _onSendRegisterOtp(
    SendRegisterOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.sendRegisterOtp(phone: event.phone);
    result.fold(
      (failure) => emit(AuthFailure(message: failure.errorMessage)),
      (_) => emit(AuthOtpSentSuccessfully()),
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.register(
      phone: event.phone,
      name: event.name,
      otp: event.otp,
      age: event.age,
      gender: event.gender,
      weight: event.weight,
      governorate: event.governorate,
      district: event.district,
      chronicDiseases: event.chronicDiseases,
      dataSharingConsent: event.dataSharingConsent,
    );
    result.fold(
      (failure) => emit(AuthFailure(message: failure.errorMessage)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.logout();
    result.fold(
      (failure) => emit(AuthFailure(message: failure.errorMessage)),
      (_) => emit(AuthUnauthenticated()),
    );
  }
}
