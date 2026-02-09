import 'package:flutter/material.dart';
import 'package:sehty/features/auth/domain/entities/user_entity.dart';

@immutable
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.patientCode,
    required super.age,
    required super.gender,
    required super.weight,
    required super.governorate,
    required super.district,
    required super.dataSharingConsent,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      patientCode: json['patient_code'] as String? ?? '',
      age: json['age'] is String
          ? int.tryParse(json['age']) ?? 0
          : (json['age'] as num?)?.toInt() ?? 0,
      gender: json['gender'] as String? ?? '',
      weight: json['weight'] is String
          ? double.tryParse(json['weight']) ?? 0.0
          : (json['weight'] as num?)?.toDouble() ?? 0.0,
      governorate: json['governorate'] as String? ?? '',
      district: json['district'] as String? ?? '',
      dataSharingConsent: json['data_sharing_consent'] is int
          ? (json['data_sharing_consent'] as int) == 1
          : json['data_sharing_consent'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? DateTime.now()
          : DateTime.parse(json['created_at'] as String),
    );
  }

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
    'created_at': createdAt.toIso8601String(),
  };
}
