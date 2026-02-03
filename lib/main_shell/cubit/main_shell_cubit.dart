import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_shell_state.dart';

class MainShellCubit extends Cubit<MainShellState> {
  MainShellCubit() : super(const MainShellChanged(0));

  int get currentIndex => (state as MainShellChanged).index;

  void changeTab(int index) {
    emit(MainShellChanged(index));
  }
}
