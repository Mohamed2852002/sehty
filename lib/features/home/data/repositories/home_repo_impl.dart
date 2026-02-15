import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/home/data/datasources/home_remote_data_source.dart';
import 'package:sehty/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:sehty/features/home/domain/repositories/home_repo.dart';
import '../models/home_dashboard_model/home_dashboard_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, HomeDashboardEntity>> getHomeDashboard() async {
    try {
      final response = await homeRemoteDataSource.getHomeDashboard();
      final model = HomeDashboardModel.fromJson(response['data']);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
