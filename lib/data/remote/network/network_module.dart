import 'package:bro_grow_app/data/remote/network/app_network_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// A class responsible for configuring and providing the Dio instance for network operations.
class NetworkModule {
  Dio get dio {
    // Creating a Dio instance with base options, including the base URL and status validation.
    final dio = Dio(
      BaseOptions(
          baseUrl: AppNetworkConstants.baseURL,
          headers: AppNetworkConstants.headers,
          validateStatus: (_) => true),
    );

    // Adding the defined interceptors to the Dio instance.
    dio.interceptors.addAll(dioInterceptors);

    // Returning the configured Dio instance.
    return dio;
  }

  // Dio logger for logging network requests and responses in a readable format.
  PrettyDioLogger get dioLoggingInterceptor => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      );

  // List of interceptors to be added to the Dio instance.
  List<Interceptor> get dioInterceptors => [dioLoggingInterceptor];

  // Method to create and configure the Dio instance.
}
