class Patient {
  int? id;
  String? name;
  String? patientCode;
  String? phone;

  Patient({this.id, this.name, this.patientCode, this.phone});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    patientCode: json['patient_code'] as String?,
    phone: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'patient_code': patientCode,
    'phone': phone,
  };
}
