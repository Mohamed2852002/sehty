import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> sendLoginOtp({required String phone});
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String otp,
  });
  Future<Either<Failure, Unit>> sendRegisterOtp({required String phone});
  Future<Either<Failure, UserEntity>> register({
    required String phone,
    required String name,
    required String otp,
    required int age,
    required String gender,
    required double weight,
    required String governorate,
    required String district,
    required List<int> chronicDiseases,
    required bool dataSharingConsent,
  });
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<Either<Failure, Unit>> logout();
}
