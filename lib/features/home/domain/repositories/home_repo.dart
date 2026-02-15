import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/home/domain/entities/home_dashboard_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeDashboardEntity>> getHomeDashboard();
}
