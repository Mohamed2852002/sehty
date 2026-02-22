import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/notification/presentation/bloc/notification_bloc.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.notifications,
                  style: AppStyles.styleBold24(context),
                ),
                BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    if (state is NotificationsLoaded && state.unreadCount > 0) {
                      return Text(
                        '${state.unreadCount} ${context.l10n.newNotifications}',
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      );
                    }
                    return Text(
                      context.l10n.newNotifications,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.grey),
                    );
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: AppColors.darkColor),
          ),
        ],
      ),
    );
  }
}
