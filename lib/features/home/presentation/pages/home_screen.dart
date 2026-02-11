import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/home/presentation/widgets/daily_summary_widget.dart';
import 'package:sehty/features/home/presentation/widgets/family_follow_up_widget.dart';
import 'package:sehty/features/home/presentation/widgets/home_action_buttons.dart';
import 'package:sehty/features/home/presentation/widgets/home_top_bar.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MedicationBloc>().add(GetTodayMedicationsEvent());
        },
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 22,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTopBar(),
                  FamilyFollowUpWidget(),
                  DailySummaryWidget(),
                  HomeActionButtons(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
