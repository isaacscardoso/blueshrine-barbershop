import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  BaseOptions get _baseOptions {
    return BaseOptions(
      baseUrl: 'http://192.168.0.101:8080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
    );
  }

  RestClient() : super() {
    options = _baseOptions;
    interceptors.addAll([
      LogInterceptor(responseBody: true, requestBody: true),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
