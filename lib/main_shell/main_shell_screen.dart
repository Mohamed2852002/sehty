import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/auth/presentation/pages/login_screen.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<MainShellCubit>().currentIndex,
        children: const [LoginScreen(), LoginScreen(), LoginScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: context.watch<MainShellCubit>().currentIndex,
        onDestinationSelected: context.read<MainShellCubit>().changeTab,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
