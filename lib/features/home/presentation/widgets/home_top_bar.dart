import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/header_container.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';
import 'package:sehty/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/notification_bottom_sheet.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        String name = '';
        if (state is HomeLoaded) {
          name = state.dashboard.welcome?.name ?? '';
        }
        return HeaderContainer(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.l10n.hello}, ${name.isNotEmpty ? name : ''}',
                      style: AppStyles.styleBold24(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      context.l10n.wishYouHealth,
                      style: AppStyles.styleRegular18(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, notifState) {
                  final int unreadCount = notifState is NotificationsLoaded
                      ? notifState.unreadCount
                      : 0;

                  return InkWell(
                    onTap: () {
                      // Clear the badge
                      context.read<NotificationBloc>().add(
                        MarkNotificationsReadEvent(),
                      );
                      // Open bottom sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => BlocProvider.value(
                          value: context.read<NotificationBloc>(),
                          child: const NotificationBottomSheet(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.iconsHomeNotificationBell,
                          ),
                        ),
                        if (unreadCount > 0)
                          Positioned(
                            right: -4,
                            top: -4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.fromBorderSide(
                                  BorderSide(color: Colors.white, width: 1.5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  unreadCount > 99
                                      ? '99+'
                                      : unreadCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
