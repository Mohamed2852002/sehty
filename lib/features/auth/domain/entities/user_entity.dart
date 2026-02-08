class UserEntity {
  final int id;
  final String name;
  final String phone;
  final String patientCode;
  final int age;
  final String gender;
  final double weight;
  final String governorate;
  final String district;
  final bool dataSharingConsent;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.patientCode,
    required this.age,
    required this.gender,
    required this.weight,
    required this.governorate,
    required this.district,
    required this.dataSharingConsent,
    required this.createdAt,
  });
}
