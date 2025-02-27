import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/login_response_entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Faliurs errors;
  LoginErrorState({required this.errors});
}

class LoginSuccesState extends LoginStates {
  LoginResponseEntity responseEntity;
  LoginSuccesState({required this.responseEntity});
}
