import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final String? type;
  final bool? isRead;
  final DateTime? createdAt;

  const NotificationEntity({
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, body, type, isRead, createdAt];
}
