import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/end_points.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/data/model/login_response_dm.dart';
import 'package:ecommerceapp/data/model/register_response_dm.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerceapp/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Faliurs, RegisterResponseDm>> register(String email,
      String password, String name, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response =
            await apiManager.postData(endPoint: EndPoints.signUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return left(ServerFaliure(errorMessage: registerResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliurs, LoginResponseDm>> login(
      String email, String password) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response =
            await apiManager.postData(endPoint: EndPoints.signIn, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          MyServices.setString("token", loginResponse.token!);
          return Right(loginResponse);
        } else {
          return left(ServerFaliure(errorMessage: loginResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }
}
