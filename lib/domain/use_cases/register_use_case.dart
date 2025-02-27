import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/register_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/auth/auth_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthReposatry authReposatry;

  RegisterUseCase({required this.authReposatry});

  Future<Either<Faliurs, RegisterResponseEntity>> invoke(String email,
      String password, String name, String rePassword, String phone) {
    return authReposatry.register(email, password, name, rePassword, phone);
  }
}
