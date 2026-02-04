import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/home/presentation/pages/home_screen.dart';
import 'package:sehty/features/medication/presentation/pages/medications_screen.dart';
import 'package:sehty/features/monitor/presentation/pages/monitor_screen.dart';
import 'package:sehty/features/profile/presentation/pages/profile_screen.dart';
import 'package:sehty/features/record/presentation/pages/medical_records_screen.dart';

import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';
import 'package:sehty/main_shell/widgets/custom_bottom_nav_bar.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: IndexedStack(
            index: context.watch<MainShellCubit>().currentIndex,
            children: const [
              HomeScreen(),
              MedicationsScreen(),
              MedicalRecordsScreen(),
              MonitorScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
