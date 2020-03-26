import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'AppException.dart';

class DioHelper {
  Dio _dio;

  static DioHelper get instance => _instance;
  static final DioHelper _instance = DioHelper._privateConstructor();

  DioHelper._privateConstructor() {
    _dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/pokemon"));

    _dio.interceptors.add(PrettyDioLogger(
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        compact: false));

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //SecureStorage
      /*if (token != null) {
        _dio.options.headers[HttpHeaders.authorizationHeader] = "Bearer" + token
      }*/
    }));
  }

  Future<dynamic> get(String route, [Map<String, dynamic> parameters]) async {
    var responseJson;
    try {
      final response = await _dio.get(route, queryParameters: parameters);
      responseJson = response.data;
    } on SocketException {
      debugPrint("No network");
    } on DioError catch (e) {
      _returnResponse(e.response);
    }

    return responseJson;
  }

  Future<dynamic> post(String route, [dynamic data, Options options]) async {
    var responseJson;
    try {
      final response = await _dio.post(route, data: data, options: options);
      responseJson = response.data;
    } on SocketException {
      debugPrint("No network");
    } on DioError catch (e) {
      _returnResponse(e.response);
    }
    return responseJson;
  }

  Future<dynamic> put(String route, [dynamic data, Options options]) async {
    var responseJson;
    try {
      final response = await _dio.put(route, data: data, options: options);
      responseJson = response.data;
    } on SocketException {
      debugPrint("No network");
    } on DioError catch (e) {
      _returnResponse(e.response);
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data["Status"]);
    }
  }
}
