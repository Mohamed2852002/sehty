import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';
import 'package:sehty/features/home/presentation/widgets/daily_summary_widget.dart';
import 'package:sehty/features/home/presentation/widgets/family_follow_up_widget.dart';
import 'package:sehty/features/home/presentation/widgets/home_action_buttons.dart';
import 'package:sehty/features/home/presentation/widgets/home_top_bar.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeDashboardEvent());
    context.read<MedicationBloc>().add(GetTodayMedicationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MedicationBloc, MedicationState>(
        listener: (context, state) {
          if (state is MedicationConfirmed) {
            context.read<HomeBloc>().add(GetHomeDashboardEvent());
            context.read<MedicationBloc>().add(GetTodayMedicationsEvent());
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(GetHomeDashboardEvent());
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
      ),
    );
  }
}
