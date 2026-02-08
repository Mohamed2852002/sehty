class NotificationModel {
  int? id;
  String? title;
  String? body;
  String? type;
  bool? isRead;
  DateTime? createdAt;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      isRead: json['is_read'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'type': type,
    'is_read': isRead,
    'created_at': createdAt?.toIso8601String(),
  };
}
