import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';
import 'package:sehty/features/home/presentation/widgets/medication_list.dart';
import 'package:sehty/features/home/presentation/widgets/today_medicine_count_card.dart';

class DailySummaryWidget extends StatelessWidget {
  const DailySummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeLoaded,
      builder: (context, state) {
        int total = 0;
        int taken = 0;

        if (state is HomeLoaded) {
          total = state.dashboard.dailySummary?.total ?? 0;
          taken = state.dashboard.dailySummary?.taken ?? 0;
        }

        return CustomContainer(
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 8,
                children: [
                  IconContainer(
                    child: SvgPicture.asset(AppAssets.iconsHomeMedicationIcon),
                  ),
                  Expanded(
                    child: Text(
                      context.l10n.todaySummary,
                      style: AppStyles.styleBold20(context),
                    ),
                  ),
                ],
              ),
              TodayMedicineCount(total: total, taken: taken),
              const MedicationList(),
            ],
          ),
        );
      },
    );
  }
}
