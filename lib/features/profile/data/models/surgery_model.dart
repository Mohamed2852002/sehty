class SurgeryModel {
  int? id;
  String? surgeryName;
  String? surgeryDate;
  DateTime? createdAt;

  SurgeryModel({this.id, this.surgeryName, this.surgeryDate, this.createdAt});

  factory SurgeryModel.fromJson(Map<String, dynamic> json) => SurgeryModel(
    id: json['id'] == null ? null : int.tryParse(json['id'].toString()),
    surgeryName: json['surgery_name'] as String?,
    surgeryDate: json['surgery_date'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'surgery_name': surgeryName,
    'surgery_date': surgeryDate,
    'created_at': createdAt?.toIso8601String(),
  };
}
