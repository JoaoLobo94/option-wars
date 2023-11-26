import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<ApiResult> signUp(String username, String password, String lnurl) async {
    // Construct the URL for your API endpoint
    String apiEndpoint = '$baseUrl/users';

    // Create a Map with your request data
    Map<String, dynamic> requestData = {
      'username': username,
      'password': password,
      'lnurl': lnurl,
    };

    try {
      final response = await http.post(
        Uri.parse(apiEndpoint),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        return ApiResult.ok(json.decode(response.body));
      } else {
        Map<String, dynamic> errorResponse = json.decode(response.body);
        String errorMessage = errorResponse['message'][0].toString();
        return ApiResult.failure('$errorMessage');
      }
    } catch (error) {
      return ApiResult.failure('Error making HTTP request: $error');
    }
  }
}

class ApiResult {
  final bool success;
  final dynamic data;
  final String errorMessage;

  ApiResult({
    required this.success,
    this.data,
    this.errorMessage = '',
  });

  static ApiResult ok(dynamic data) {
    return ApiResult(success: true, data: data);
  }

  static ApiResult failure(String errorMessage) {
    return ApiResult(success: false, errorMessage: errorMessage);
  }
}
