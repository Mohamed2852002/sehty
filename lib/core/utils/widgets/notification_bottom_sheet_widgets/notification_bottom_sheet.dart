import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/bottom_sheet_footer.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/bottom_sheet_header.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/notification_item.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.65,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetHeader(),
            const Divider(height: 1),
            Flexible(
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is NotificationError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          state.message,
                          style: AppStyles.styleRegular14(
                            context,
                          ).copyWith(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (state is NotificationsLoaded) {
                    final notifications = state.notifications;
                    if (notifications.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Text(
                            context.l10n.notifications,
                            style: AppStyles.styleRegular14(
                              context,
                            ).copyWith(color: Colors.grey),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return _buildNotificationItem(context, notification);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            const BottomSheetFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationEntity notification,
  ) {
    final iconConfig = _getIconConfig(notification.type);
    final timeText = _formatTime(context, notification.createdAt);

    return NotificationItem(
      title: notification.title ?? '',
      subtitle: notification.body ?? '',
      time: timeText,
      iconData: iconConfig.icon,
      iconColor: iconConfig.color,
      iconBgColor: iconConfig.color.withValues(alpha: 0.1),
      isUnread: notification.isRead == false,
    );
  }

  String _formatTime(BuildContext context, DateTime? createdAt) {
    if (createdAt == null) return '';
    final now = DateTime.now();
    final diff = now.difference(createdAt);

    if (diff.inMinutes < 60) {
      return '${context.l10n.minutesAgo}';
    } else if (diff.inHours < 2) {
      return '${context.l10n.hourAgo}';
    } else if (diff.inHours < 24) {
      return '${context.l10n.hoursAgo}';
    } else if (diff.inDays == 1) {
      return '${context.l10n.yesterday}';
    } else {
      return '${context.l10n.twoDaysAgo}';
    }
  }

  _IconConfig _getIconConfig(String? type) {
    switch (type) {
      case 'medication':
        return _IconConfig(Icons.link, Colors.blue);
      case 'family':
        return _IconConfig(Icons.person_add_alt_1_outlined, Colors.green);
      case 'confirmed':
        return _IconConfig(Icons.check_circle_outline, Colors.green);
      case 'reminder':
        return _IconConfig(Icons.access_time, Colors.red);
      case 'medical_file':
        return _IconConfig(Icons.description_outlined, Colors.blue.shade300);
      default:
        return _IconConfig(Icons.notifications_outlined, AppColors.primary);
    }
  }
}

class _IconConfig {
  final IconData icon;
  final Color color;
  const _IconConfig(this.icon, this.color);
}
