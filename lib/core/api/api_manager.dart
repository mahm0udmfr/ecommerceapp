import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.get(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
        ));
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? body,
  }) {
    return dio.post(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
        ),
        data: body);
  }
}
