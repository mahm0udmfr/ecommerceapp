import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/login_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/auth/auth_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthReposatry authReposatry;

  LoginUseCase({required this.authReposatry});

  Future<Either<Faliurs, LoginResponseEntity>> invoke(
      String email, String password) {
    return authReposatry.login(email, password);
  }
}
