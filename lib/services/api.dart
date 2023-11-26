import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<ApiResult> sendRequest({
    required String username,
    required String password,
    required String path,
    required String method,
    String? lnurl,
  }) async {
    String apiEndpoint = '$baseUrl/$path';

    Map<String, dynamic> requestData = {
      'username': username,
      'password': password,
      'lnurl': lnurl,
    };

    try {
      late http.Response response;

      if (method == 'GET') {
        response = await http.get(
          Uri.parse(apiEndpoint),
          headers: {'Content-Type': 'application/json'},
        );
      } else if (method == 'POST') {
        response = await http.post(
          Uri.parse(apiEndpoint),
          body: json.encode(requestData),
          headers: {'Content-Type': 'application/json'},
        );
      } else {
        throw Exception('Invalid HTTP method: $method');
      }

      if (response.statusCode == 202) {
        return ApiResult.ok(json.decode(response.body));
      } else {
        Map<String, dynamic> errorResponse = json.decode(response.body);
        String errorMessage = errorResponse['message'].toString();
        return ApiResult.failure(errorMessage);
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
