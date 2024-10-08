import 'package:dio/dio.dart';
import 'package:e_commrece/core/database/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["token"]= CacheHelper().getData(key: "token");
    super.onRequest(options, handler);
  }
}