class Patient {
  int? id;
  String? name;
  String? phone;
  String? patientCode;

  Patient({this.id, this.name, this.phone, this.patientCode});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    patientCode: json['patient_code'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'patient_code': patientCode,
  };
}
