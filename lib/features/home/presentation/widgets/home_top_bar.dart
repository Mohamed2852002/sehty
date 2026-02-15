import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/header_container.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/notification_bottom_sheet.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // String greeting = context.l10n.hello;
        String name = '';
        // String wish = context.l10n.wishYouHealth;

        if (state is HomeLoaded) {
          // greeting = state.dashboard.welcome?.greeting ?? context.l10n.hello;
          name = state.dashboard.welcome?.name ?? '';
          // wish = state.dashboard.welcome?.message ?? context.l10n.wishYouHealth;
        }

        return HeaderContainer(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.l10n.hello}, ${name.isNotEmpty ? name : ''}', // Hardcoded name for now as per image
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
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const NotificationBottomSheet(),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Stack(
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
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
