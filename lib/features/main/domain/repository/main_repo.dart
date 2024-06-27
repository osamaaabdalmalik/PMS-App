import 'package:dartz/dartz.dart';
import 'package:pms_app/core/helpers/failures.dart';
import 'package:pms_app/features/main/domain/entities/home_data_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, HomeData>> getHome();
}
