import 'package:sehty/features/home/domain/entities/daily_summary_entity.dart';

class DailySummary {
  int? total;
  int? taken;
  int? untaken;
  bool? isComplete;

  DailySummary({this.total, this.taken, this.untaken, this.isComplete});

  factory DailySummary.fromJson(Map<String, dynamic> json) => DailySummary(
    total: json['total'] as int?,
    taken: json['taken'] as int?,
    untaken: json['untaken'] as int?,
    isComplete: json['is_complete'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'taken': taken,
    'untaken': untaken,
    'is_complete': isComplete,
  };

  DailySummaryEntity toEntity() => DailySummaryEntity(
    total: total ?? 0,
    taken: taken ?? 0,
    untaken: untaken ?? 0,
    isComplete: isComplete ?? false,
  );
}
