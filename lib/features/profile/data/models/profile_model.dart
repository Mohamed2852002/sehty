import 'package:sehty/features/profile/data/models/chronic_disease_model.dart';
import 'package:sehty/features/profile/data/models/surgery_model.dart';

class ProfileModel {
  int? id;
  String? name;
  String? phone;
  String? patientCode;
  int? age;
  String? gender;
  double? weight;
  String? governorate;
  String? district;
  bool? dataSharingConsent;
  List<ChronicDiseaseModel>? chronicDiseases;
  List<SurgeryModel>? surgeries;
  DateTime? createdAt;

  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id'] == null ? null : int.tryParse(json['id'].toString()),
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    patientCode: json['patient_code'] as String?,
    age: json['age'] == null ? null : int.tryParse(json['age'].toString()),
    gender: json['gender'] as String?,
    weight: json['weight'] == null
        ? null
        : double.tryParse(json['weight'].toString()),
    governorate: json['governorate'] as String?,
    district: json['district'] as String?,
    dataSharingConsent: json['data_sharing_consent'] as bool?,
    chronicDiseases: (json['chronic_diseases'] as List<dynamic>?)
        ?.map((e) => ChronicDiseaseModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    surgeries: (json['surgeries'] as List<dynamic>?)
        ?.map((e) => SurgeryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'patient_code': patientCode,
    'age': age,
    'gender': gender,
    'weight': weight,
    'governorate': governorate,
    'district': district,
    'data_sharing_consent': dataSharingConsent,
    'chronic_diseases': chronicDiseases?.map((e) => e.toJson()).toList(),
    'surgeries': surgeries?.map((e) => e.toJson()).toList(),
    'created_at': createdAt?.toIso8601String(),
  };
}
