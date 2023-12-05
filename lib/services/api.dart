import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<ApiResult> sendAccountRequest({
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

  Future<ApiResult> requestInvoice({
    required String amount,
    required String path,
    required String token,
  }) async {
    String apiEndpoint = '$baseUrl/$path';

    Map<String, dynamic> requestData = {
      'amount': amount,
    };

    try {
      late http.Response response;
        response = await http.post(
          Uri.parse(apiEndpoint),
          body: json.encode(requestData),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
        );

      if (response.statusCode == 201) {
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

  Future<ApiResult> checkInvoicePayment({
    required String paymentHash,
    required int id,
    required String amount,
    required String path,
    required String token,
  }) async {
    String apiEndpoint = '$baseUrl/$path/$id';

    Map<String, dynamic> requestData = {
      'payment_hash': paymentHash,
      'amount': amount,
    };

    try {
      late http.Response response;
        response = await http.patch(
          Uri.parse(apiEndpoint),
          body: json.encode(requestData),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
        );

      if (response.statusCode == 200) {
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

  Future<ApiResult> createBet({
    required String direction,
    required String amount,
    required String username,
    required double startPrice,
    required String path,
    required String token,
  }) async {
    String apiEndpoint = '$baseUrl/$path';

    Map<String, dynamic> requestData = {
      'bet_type': direction,
      'amount': amount,
      'username': username,
      'start_price': startPrice
    };

    try {
      late http.Response response;
        response = await http.post(
          Uri.parse(apiEndpoint),
          body: json.encode(requestData),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
        );

      if (response.statusCode == 201) {
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

  Future<ApiResult> settleBet({
    required String path,
    required String token,
  }) async {
    String apiEndpoint = '$baseUrl/$path';
    try {
      late http.Response response;
      response = await http.patch(
        Uri.parse(apiEndpoint),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
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
