import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_header.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_info_card.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_reminder_card.dart';

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MedicationBloc>().add(GetMedicationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async =>
            context.read<MedicationBloc>().add(GetMedicationsEvent()),
        child: BlocBuilder<MedicationBloc, MedicationState>(
          buildWhen: (previous, current) {
            return current is MedicationLoading ||
                current is MedicationError ||
                current is MedicationsLoaded;
          },
          builder: (context, state) {
            if (state is MedicationLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            List<MedicationEntity> medications = [];
            if (state is MedicationsLoaded) {
              medications = state.medications;
            } else if (state is MedicationError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<MedicationBloc>().add(
                        GetMedicationsEvent(),
                      ),
                      child: Text(context.l10n.retry),
                    ),
                  ],
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    spacing: 24,
                    children: [MedicationHeader(), MedicationReminderCard()],
                  ),
                ),
                if (medications.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) {
                        return MedicationInfoCard(
                          medication: medications[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 24);
                      },
                      itemCount: medications.length,
                    ),
                  )
                else
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.iconsMonitorGreyMedicationIcon,
                          width: 80,
                          height: 80,
                        ),
                        Text(
                          context.l10n.noMedicationsAdded,
                          style: AppStyles.styleRegular18(
                            context,
                          ).copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
