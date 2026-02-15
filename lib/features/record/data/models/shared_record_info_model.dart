import 'package:sehty/features/record/domain/entities/shared_record_info_entity.dart';

class SharedRecordInfoModel {
  String? shareUrl;
  DateTime? expiresAt;

  SharedRecordInfoModel({this.shareUrl, this.expiresAt});

  factory SharedRecordInfoModel.fromJson(Map<String, dynamic> json) {
    return SharedRecordInfoModel(
      shareUrl: json['share_url'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'share_url': shareUrl,
    'expires_at': expiresAt?.toIso8601String(),
  };

  SharedRecordInfoEntity toEntity() {
    return SharedRecordInfoEntity(
      shareUrl: shareUrl,
      expiresAt: expiresAt,
    );
  }
}
