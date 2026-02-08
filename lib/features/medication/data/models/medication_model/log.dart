class Log {
  int? id;
  DateTime? scheduledAt;
  DateTime? takenAt;
  String? status;
  DateTime? confirmedAt;

  Log({this.id, this.scheduledAt, this.takenAt, this.status, this.confirmedAt});

  factory Log.fromJson(Map<String, dynamic> json) => Log(
    id: json['id'] as int?,
    scheduledAt: json['scheduled_at'] == null
        ? null
        : DateTime.parse(json['scheduled_at'] as String),
    takenAt: json['taken_at'] == null
        ? null
        : DateTime.parse(json['taken_at'] as String),
    status: json['status'] as String?,
    confirmedAt: json['confirmed_at'] == null
        ? null
        : DateTime.parse(json['confirmed_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'scheduled_at': scheduledAt?.toIso8601String(),
    'taken_at': takenAt?.toIso8601String(),
    'status': status,
    'confirmed_at': confirmedAt?.toIso8601String(),
  };
}
