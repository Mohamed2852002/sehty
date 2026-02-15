import 'package:sehty/features/home/domain/entities/home_medication_entity.dart';

class Medication {
  int? id;
  String? name;
  String? time;
  bool? isTaken;

  Medication({this.id, this.name, this.time, this.isTaken});

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    id: json['id'] as int?,
    name: json['name'] as String?,
    time: json['time'] as String?,
    isTaken: json['is_taken'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'time': time,
    'is_taken': isTaken,
  };

  HomeMedicationEntity toEntity() => HomeMedicationEntity(
    id: id ?? 0,
    name: name ?? '',
    time: time ?? '',
    isTaken: isTaken ?? false,
  );
}
