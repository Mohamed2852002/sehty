import 'package:equatable/equatable.dart';

class HomeMemberEntity extends Equatable {
  final String name;
  final String relationship;
  final String role;

  const HomeMemberEntity({
    required this.name,
    required this.relationship,
    required this.role,
  });

  @override
  List<Object?> get props => [name, relationship, role];
}
