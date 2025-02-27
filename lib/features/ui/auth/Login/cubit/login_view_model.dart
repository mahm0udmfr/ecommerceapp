import 'package:ecommerceapp/domain/use_cases/login_use_case.dart';
import 'package:ecommerceapp/features/ui/auth/Login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase registerUseCase;

  LoginViewModel({required this.registerUseCase}) : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "look.mahmoud172@gmail.com");
  TextEditingController passwordController = TextEditingController(text:"Mahmoud172@");

  void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoadingState());
    var either = await registerUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold(
      (error) {
        emit(LoginErrorState(errors: error));
      },
      (response) {
        emit(LoginSuccesState(responseEntity: response));
      },
    );
  }
}
