import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/register_response_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  Faliurs errors;
  RegisterErrorState({required this.errors});
}

class RegisterSuccesState extends RegisterStates {
  RegisterResponseEntity responseEntity;
  RegisterSuccesState({required this.responseEntity});
}
