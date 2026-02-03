part of 'main_shell_cubit.dart';

sealed class MainShellState extends Equatable {
  const MainShellState();

  @override
  List<Object> get props => [];
}

final class MainShellInitial extends MainShellState {}

final class MainShellChanged extends MainShellState {
  final int index;
  const MainShellChanged(this.index);

  @override
  List<Object> get props => [index];
}
