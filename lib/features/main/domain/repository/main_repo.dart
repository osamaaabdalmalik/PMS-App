import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepo {
  Future<Either<Failure, HomeData>> getHome();
}
