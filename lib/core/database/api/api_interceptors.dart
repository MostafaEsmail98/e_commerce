import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["land"]= "ar";
    options.headers["kl"]="k";
    super.onRequest(options, handler);
  }
}