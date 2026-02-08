import 'package:equatable/equatable.dart';
import 'package:sehty/features/profile/domain/entities/chronic_disease_entity.dart';
import 'package:sehty/features/profile/domain/entities/surgery_entity.dart';

class ProfileEntity extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? patientCode;
  final int? age;
  final String? gender;
  final double? weight;
  final String? governorate;
  final String? district;
  final bool? dataSharingConsent;
  final List<ChronicDiseaseEntity>? chronicDiseases;
  final List<SurgeryEntity>? surgeries;
  final DateTime? createdAt;

  const ProfileEntity({
    this.id,
    this.name,
    this.phone,
    this.patientCode,
    this.age,
    this.gender,
    this.weight,
    this.governorate,
    this.district,
    this.dataSharingConsent,
    this.chronicDiseases,
    this.surgeries,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phone,
    patientCode,
    age,
    gender,
    weight,
    governorate,
    district,
    dataSharingConsent,
    chronicDiseases,
    surgeries,
    createdAt,
  ];
}
