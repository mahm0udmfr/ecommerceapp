import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/login_response_entity.dart';
import 'package:ecommerceapp/domain/entities/register_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/auth/auth_reposatry.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthReposatry)
class AuthReposatryImpl implements AuthReposatry {
  AuthRemoteDataSource authRemoteDataSource;

  AuthReposatryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Faliurs, RegisterResponseEntity>> register(String email,
      String password, String name, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        email, password, name, rePassword, phone);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }

  @override
  Future<Either<Faliurs, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
