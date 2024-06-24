import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class StatusHandlerService {
  StatusHandlerService() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45
      ..maskType = EasyLoadingMaskType.black
      ..radius = 15;
  }

  static showLoading() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(
      status: AppStrings.waiting,
      dismissOnTap: false,
    );
  }

  static showError({required String message, int durationSeconds = 5}) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = Duration(seconds: durationSeconds)
      ..errorWidget = const Icon(
        Icons.error_outline_rounded,
        size: 45,
      );

    EasyLoading.showError(
      message,
      dismissOnTap: true,
    );
  }

  static showOfflineError() {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 5)
      ..errorWidget = const Icon(
        Icons.wifi_off_rounded,
        size: 45,
      );

    EasyLoading.showError(
      AppStrings.offline,
      dismissOnTap: true,
    );
  }

  static showInternalServerError({EasyLoadingMaskType maskType = EasyLoadingMaskType.black}) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 5)
      ..errorWidget = const Icon(
        Icons.report_problem_outlined,
        size: 45,
      );

    EasyLoading.showError(
      AppStrings.internalServerError,
      maskType: maskType,
      dismissOnTap: true,
    );
  }

  static showSuccess({EasyLoadingMaskType maskType = EasyLoadingMaskType.black}) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 3)
      ..successWidget = const Icon(
        Icons.check,
        color: AppColors.success,
        size: 45,
      );
    EasyLoading.showSuccess(
      AppStrings.itWasDoneSuccessfully,
      maskType: maskType,
      dismissOnTap: true,
    );
  }

  static dismiss() {
    EasyLoading.dismiss(animation: true);
  }

  static showToast({
    required String message,
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.bottom,
  }) {
    EasyLoading.instance
      ..userInteractions = true
      ..displayDuration = const Duration(seconds: 5);
    EasyLoading.showToast(
      message,
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
      toastPosition: toastPosition,
    );
  }
}
