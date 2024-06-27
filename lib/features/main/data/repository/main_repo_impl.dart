import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:pms_app/core/helpers/failures.dart';
import 'package:pms_app/core/services/state_manager_service.dart';
import 'package:pms_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:pms_app/features/main/domain/entities/home_data_entity.dart';
import 'package:pms_app/features/main/domain/repository/main_repo.dart';
import 'package:pms_app/injection_container.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;

  const MainRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getHome() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHome` in |MainRepoImpl|");
      var homeData = await mainRemoteDataSource.getHome();
      InjectionContainer.getIt<Logger>().w("End `getHome` in |MainRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHome` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(StateManagerService.getFailureFromException(e));
    }
  }
}
