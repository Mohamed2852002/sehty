class Schedule {
  int? id;
  String? time;
  List<int>? daysOfWeek;

  Schedule({this.id, this.time, this.daysOfWeek});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    final rawDays = json['days'] ?? json['days_of_week'];
    return Schedule(
      id: json['id'] as int?,
      time: json['time'] as String?,
      daysOfWeek: rawDays == null ? null : List<int>.from(rawDays),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time,
    'days_of_week': daysOfWeek,
  };
}
