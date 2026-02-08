class Schedule {
  int? id;
  String? time;
  List<int>? daysOfWeek;

  Schedule({this.id, this.time, this.daysOfWeek});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json['id'] as int?,
    time: json['time'] as String?,
    daysOfWeek: json['days_of_week'] as List<int>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time,
    'days_of_week': daysOfWeek,
  };
}
