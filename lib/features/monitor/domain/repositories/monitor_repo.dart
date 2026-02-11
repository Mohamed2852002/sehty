import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/family_member_medication_entity.dart';

abstract class MonitorRepo {
  Future<Either<Failure, List<FamilyMemberEntity>>>
  getListOfFamilyConnections();

  Future<Either<Failure, FamilyMemberMedicationsEntity>>
  showOneFamilyMedication({required int memberId});

  Future<Either<Failure, FamilyMemberEntity>> inviteFamilyMember({
    required String phone,
    required String relationship,
  });

  Future<Either<Failure, FamilyMemberEntity>> addNewMember({
    required String name,
    required String phone,
    required String relationship,
  });

  Future<Either<Failure, Unit>> approveFamilyInvitation({
    required int invitationId,
  });
}
