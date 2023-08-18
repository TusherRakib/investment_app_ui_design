import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/app_onstants.dart';

class Network {
  Dio getDio({bool isFormData = false}) {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrlProd,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    Dio dio = Dio(options);

    if (isFormData) {
      options.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    }
    return dio;
  }
}

Network network = Network();
