part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;

  const factory MainState.loading() = _Loading;

  const factory MainState.loaded(HomeData homeData) = _Loaded;

  const factory MainState.changeTabSuccess(HomeData? homeData) = _ChangeTabSuccess;

  const factory MainState.error(String message) = _Error;
}
