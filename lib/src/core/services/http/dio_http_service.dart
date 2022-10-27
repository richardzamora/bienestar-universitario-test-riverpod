import 'package:app_bienestar_universitario/src/core/configs/configs.dart';
import 'package:app_bienestar_universitario/src/core/exceptions/http_exception.dart';
import 'package:app_bienestar_universitario/src/core/services/http/dio-interceptors/cache_interceptor.dart';
import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';
import 'package:app_bienestar_universitario/src/core/services/storage/storage_service.dart';
import 'package:dio/dio.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService(
    this.storageService, {
    Dio? dioOverride,
    bool enableCaching = true,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    if (enableCaching) {
      dio.interceptors.add(CacheInterceptor(storageService));
    }
  }

  /// Storage service used for caching http responses
  final StorageService storageService;

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    final Response response = await dio.get<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data as Map<String, dynamic>;
  }

  @override
  Future<List<dynamic>> getAll(String endpoint,
      {Map<String, dynamic>? queryParameters,
      bool forceRefresh = false}) async {
    final Response response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    print(response.data);
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data as List<dynamic>;
  }

  @override
  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data}) async {
    final Response response = await dio.post<String>(endpoint,
        queryParameters: queryParameters, data: data);

    if (response.data == null ||
        !(response.statusCode == 200 || response.statusCode == 201)) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
