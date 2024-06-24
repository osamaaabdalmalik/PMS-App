import 'dart:convert';

import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/exception.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/services/status_handler_service.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

abstract class StateManagerService {
  static Unit getExceptionStatusCode(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return unit;
      case 400:
      case 422:
        Map body = json.decode(response.body);
        String message = body.containsKey('message') ? body['message'] : AppStrings.unexpectedException;
        throw BadRequestException(message: message);
      case 403:
        throw UnAuthorizedException();
      case 401:
        throw UnAuthenticatedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw InternalServerErrorException();
      default:
        throw UnexpectedException();
    }
  }

  static Failure getFailureFromException(Object exception) {
    if (exception is BadRequestException) {
      return BadRequestFailure(message: exception.message);
    } else if (exception is UnAuthenticatedException) {
      return const UnAuthenticatedFailure(message: AppStrings.forbidden);
    } else if (exception is UnAuthorizedException) {
      return const UnAuthorizedFailure(message: AppStrings.unauthorized);
    } else if (exception is NotFoundException) {
      return const NotFoundFailure(message: AppStrings.notFound);
    } else if (exception is InternalServerErrorException) {
      return const InternalServerErrorFailure(
        message: AppStrings.internalServerError,
      );
    } else if (exception is OfflineException) {
      return const OfflineFailure(message: AppStrings.offline);
    } else {
      InjectionContainer.getIt<Logger>().e(
        "End `getFailureFromException` Exception: ${exception.toString()}",
      );
      return const UnexpectedFailure(
        message: AppStrings.unexpectedException,
      );
    }
  }

  static GeneralStates getStateFromFailure(Failure failure) {
    if (failure is OfflineFailure) {
      StatusHandlerService.showOfflineError();
      return GeneralStates.offline;
    }
    if (failure is BadRequestFailure) {
      StatusHandlerService.showError(message: failure.message);
      return GeneralStates.badRequest;
    }
    if (failure is UnAuthenticatedFailure) {
      StatusHandlerService.showError(
        message: AppStrings.forbidden,
        durationSeconds: 8,
      );
      return GeneralStates.forbidden;
    }
    if (failure is UnAuthorizedFailure) {
      StatusHandlerService.showError(
        message: AppStrings.unauthorized,
        durationSeconds: 8,
      );
      return GeneralStates.unAuthorized;
    }
    if (failure is NotFoundFailure) {
      StatusHandlerService.showError(
        message: AppStrings.notFound,
      );
      return GeneralStates.notFound;
    }
    if (failure is InternalServerErrorFailure) {
      StatusHandlerService.showInternalServerError();
      return GeneralStates.internalServerProblem;
    }
    StatusHandlerService.showError(
      message: AppStrings.unexpectedException,
    );
    return GeneralStates.unexpectedProblem;
  }
}
