import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/profile/domain/entities/chronic_disease_entity.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/domain/entities/surgery_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();

  Future<Either<Failure, ProfileEntity>> updateProfile({
    required String name,
    required String phone,
    required int age,
    required String gender,
    required String governorate,
    required double weight,
    required String district,
    required List<int> chronicDiseases,
  });

  Future<Either<Failure, SurgeryEntity>> addSurgery({
    required String surgeryName,
    required String surgeryDate,
  });

  Future<Either<Failure, List<ChronicDiseaseEntity>>>
  getListOfChronicDiseases();
}
