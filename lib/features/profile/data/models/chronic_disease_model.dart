class ChronicDiseaseModel {
  int? id;
  String? nameAr;
  String? nameEn;

  ChronicDiseaseModel({this.id, this.nameAr, this.nameEn});

  factory ChronicDiseaseModel.fromJson(Map<String, dynamic> json) {
    return ChronicDiseaseModel(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_ar': nameAr,
    'name_en': nameEn,
  };
}
