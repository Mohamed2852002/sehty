import 'package:equatable/equatable.dart';

class ChronicDiseaseEntity extends Equatable {
  final int? id;
  final String? nameAr;
  final String? nameEn;

  const ChronicDiseaseEntity({this.id, this.nameAr, this.nameEn});

  @override
  List<Object?> get props => [id, nameAr, nameEn];
}
