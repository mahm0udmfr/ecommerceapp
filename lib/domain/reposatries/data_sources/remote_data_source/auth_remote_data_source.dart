import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/login_response_entity.dart';
import 'package:ecommerceapp/domain/entities/register_response_entity.dart';




abstract class AuthRemoteDataSource {
  Future<Either<Faliurs, RegisterResponseEntity>> register(String email,
      String password, String name, String rePassword, String phone);

        Future<Either<Faliurs, LoginResponseEntity>> login(
      String email, String password);
}
