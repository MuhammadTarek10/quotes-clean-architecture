import 'package:dio/dio.dart';
import 'package:quotes/core/utils/app_strings.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppStrings.contentType] = AppStrings.applicationJSON;
    super.onRequest(options, handler);
  }
}
