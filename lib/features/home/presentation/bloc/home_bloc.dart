import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:sehty/features/home/domain/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  HomeBloc({required this.homeRepo}) : super(HomeInitial()) {
    on<GetHomeDashboardEvent>(_onGetHomeDashboard);
  }

  Future<void> _onGetHomeDashboard(
    GetHomeDashboardEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await homeRepo.getHomeDashboard();
    result.fold(
      (failure) => emit(HomeError(message: failure.errorMessage)),
      (dashboard) => emit(HomeLoaded(dashboard: dashboard)),
    );
  }
}
