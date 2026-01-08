import 'package:dio/dio.dart';
import 'package:speech_to_text/core/constants/http_code.dart';
import 'package:speech_to_text/core/exceptions/base_exception.dart';
import 'package:speech_to_text/core/exceptions/error_response.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/repositories/local/shared_preference.dart';

class InterceptorApp extends InterceptorsWrapper {
  InterceptorApp();

  final List<String> formDataList = [];
  final List<String> urlRequiredFullResponseData = [
    'user-session/me', // Cần full response để có cả data và message
  ];
  final List<String> _pathsNotRequireToken = [
    'auth/login/account',
  ];

  static Dio? dio;

  @override
  Future onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Auto attach Bearer token for authenticated APIs
    if (!_pathsNotRequireToken.contains(options.path)) {
      final prefs = getIt<SharedPreferencesApp>();
      final token = await prefs.getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    // if (formDataList.contains(options.path)) {
    //   options.headers['contentType'] = 'multipart/form-data';
    // } else {
    //   options.headers['accept'] = 'application/json';
    //   options.headers['contentType'] = 'application/json';
    //   options.headers['x-device-id'] = await _deviceDataSource.getDeviceId();
    // }

    handler.next(options);
  }

  /// Trigger when [statusCode] = 200
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// Response data is not json, throw [ServerException]
    if (response.data is! Map && response.data is! List) {
      /// Throw [ServerException] and catch it in [onError]
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: ServerException(
            statusCode: response.statusCode ?? -1,
            message: 'Something went wrong! Invalid response format.',
          ),
        ),
      );
      return;
    }

    /// If `path` inside [urlRequiredFullResponseData] list, return response with full response data.
    if (urlRequiredFullResponseData.contains(response.requestOptions.path)) {
      handler.next(
        Response(
          requestOptions: response.requestOptions,
          data: response.data,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          headers: response.headers,
          isRedirect: response.isRedirect,
          redirects: response.redirects,
          extra: response.extra,
        ),
      );
      return;
    }

    dynamic data = response.data;
    // Only unwrap `{ data: ... }` when the key actually exists.
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      data = data['data'];
    }

    if (data is! Map && data is! List && data is! bool) {
      /// Throw [ServerException] and catch it in [onError]
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: ServerException(
            statusCode: response.statusCode ?? -1,
            message: 'Invalid response format!',
          ),
        ),
      );
      return;
    }

    handler.next(
      Response(
        requestOptions: response.requestOptions,
        data: data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
      ),
    );
  }

  /// Trigger when [statusCode] != 200 or throw an [Exception]
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.error is BaseException) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: DioExceptionType.unknown,
          error: err,
        ),
      );
      return;
    }

    /// Not receive response from server, throw [NetworkException]
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.badCertificate ||
        err.type == DioExceptionType.badResponse ||
        err.type == DioExceptionType.connectionError) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: NetworkException(message: 'Network error occurred'),
        ),
      );
      return;
    }

    /// Continue with a response

    final statusCode = err.response!.statusCode!;

    /// Response data is not json, throw [ServerException]
    if (err.response?.data is! Map) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: DioExceptionType.unknown,
          error: ServerException(statusCode: statusCode),
        ),
      );
      return;
    }

    ErrorResponse errorResponse = ErrorResponse.fromJson(
      err.response!.data ?? {},
    );
    errorResponse = errorResponse.copyWith(
      message: errorResponse.message.toString(),
      statusCode: statusCode,
    );

    String? message = errorResponse.message;
    if (message.isEmpty) {
      message = 'An error occurred! Please try again later.';
    }

    if (statusCode == HttpCode.unauthorized) {
      message = 'Unauthorized access! Please log in again.';
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: DioExceptionType.unknown,
        error: ServerException(message: message, statusCode: statusCode),
      ),
    );
  }
}