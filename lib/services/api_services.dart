import 'package:dio/dio.dart';
import 'package:investment_app_ui_design/services/network.dart';

class ApiService {
  Dio dio = network.getDio();

  Future<Response<dynamic>> getIssues(int page, int perPage) async {
    try {
      final response = await dio.get(
        'flutter/flutter/issues',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response<dynamic>> searchIssues(String query, int page, int perPage) async {
    try {
      final response = await dio.get(
        'https://api.github.com/search/issues',
        queryParameters: {
          'q': query,
          'page': page,
          'per_page': perPage,
        },
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
