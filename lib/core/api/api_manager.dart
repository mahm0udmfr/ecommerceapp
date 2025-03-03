import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
    return dio.get(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? body,
      Map<String, dynamic>? headers}) {
    return dio.post(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: body);
  }

    Future<Response> deleteData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? body,
      Map<String, dynamic>? headers}) {
    return dio.delete(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: body);
  }

      Future<Response> updateData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Object? body,
      Map<String, dynamic>? headers}) {
    return dio.put(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: body);
  }
}
