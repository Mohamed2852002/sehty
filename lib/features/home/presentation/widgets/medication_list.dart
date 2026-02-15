import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/features/home/presentation/widgets/medication_list_item.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

class MedicationList extends StatelessWidget {
  const MedicationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicationBloc, MedicationState>(
      listener: (context, state) {
        if (state is MedicationConfirmed) {
          context.read<MedicationBloc>().add(GetTodayMedicationsEvent());
        } else if (state is ConfirmMedicationError) {
          AppFunctions.showCustomSnackBar(
            context,
            state.message,
            backgroundColor: AppColors.secondary,
          );
        }
      },
      child: BlocBuilder<MedicationBloc, MedicationState>(
        buildWhen: (previous, current) =>
            current is TodayMedicationLoading ||
            current is TodayMedicationError ||
            current is TodayMedicationsLoaded,
        builder: (context, state) {
          if (state is TodayMedicationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodayMedicationError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: AppColors.secondary),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    content: Text(
                      context.l10n.retry,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      context.read<MedicationBloc>().add(
                        GetTodayMedicationsEvent(),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is TodayMedicationsLoaded) {
            if (state.medications.isEmpty) {
              return Center(
                child: Text(
                  context.l10n.noMedicationsForToday,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
              );
            }
            return Column(
              spacing: 12,
              children: state.medications.map((medication) {
                return MedicationListItem(medication: medication);
              }).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
