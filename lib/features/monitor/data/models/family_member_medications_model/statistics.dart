class Statistics {
  int? totalToday;
  int? takenToday;
  int? untakenToday;
  int? percentage;

  Statistics({
    this.totalToday,
    this.takenToday,
    this.untakenToday,
    this.percentage,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    totalToday: json['total_today'] as int?,
    takenToday: json['taken_today'] as int?,
    untakenToday: json['untaken_today'] as int?,
    percentage: json['percentage'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'total_today': totalToday,
    'taken_today': takenToday,
    'untaken_today': untakenToday,
    'percentage': percentage,
  };
}
