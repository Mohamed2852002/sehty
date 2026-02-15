import 'package:sehty/features/home/domain/entities/home_member_entity.dart';

class Member {
  String? name;
  String? relationship;
  String? role;

  Member({this.name, this.relationship, this.role});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    name: json['name'] as String?,
    relationship: json['relationship'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'relationship': relationship,
    'role': role,
  };

  HomeMemberEntity toEntity() => HomeMemberEntity(
    name: name ?? '',
    relationship: relationship ?? '',
    role: role ?? '',
  );
}
