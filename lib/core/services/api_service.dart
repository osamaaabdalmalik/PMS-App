import 'dart:convert';

import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/network_info_service.dart';
import 'package:consultations_app/core/services/state_manager_service.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> post({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> put({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> delete({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  });
}

class ApiServiceImpl extends ApiService {
  final http.Client client;
  final NetworkInfoService networkInfo;

  ApiServiceImpl({required this.client, required this.networkInfo});

  @override
  Future<Map<String, dynamic>> get({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `get` |ApiServiceImpl| url: `$baseUrl$subUrl` parameters: $parameters headers: $headers',
      );
      // if (!(await networkInfo.isConnected)) {
      // throw OfflineException();
      // }
      parameters?.removeWhere((key, value) => value == 'null');
      await Future.delayed(const Duration(seconds: 3));
      final response = await client.get(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        headers: headers,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `get` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${response.body}',
      );
      return Future.value((json.decode(response.body)));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        'End `get`|ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType} $s',
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> post({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `post` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      // if (!(await networkInfo.isConnected)) {
      // throw OfflineException();
      // }
      await Future.delayed(const Duration(seconds: 3));
      final response = await client.post(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
        ),
        body: data,
        headers: headers,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `post` `$baseUrl$subUrl` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        'End `post` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> put({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `put` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      // if (!(await networkInfo.isConnected)) {
      // throw OfflineException();
      // }
      await Future.delayed(const Duration(seconds: 3));
      final response = await client.put(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
        ),
        body: data,
        headers: headers,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `put` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        'End `put` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> delete({
    required String subUrl,
    String baseUrl = AppEndpoints.baseUrl,
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        'Start `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` data: $data parameters: $parameters headers: $headers',
      );
      // if (!(await networkInfo.isConnected)) {
      // throw OfflineException();
      // }
      await Future.delayed(const Duration(seconds: 3));
      final response = await client.delete(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
        ),
        body: data,
        headers: headers,
      );
      StateManagerService.getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        'End `delete` |ApiServiceImpl| url: `$baseUrl$subUrl` Exception: ${e.runtimeType}, $s',
      );
      rethrow;
    }
  }
}
