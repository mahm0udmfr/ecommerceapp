
import 'package:ecommerceapp/domain/use_cases/register_use_case.dart';
import 'package:ecommerceapp/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        emailController.text,
        passwordController.text,
        nameController.text,
        confirmPasswordController.text,
        phoneNumberController.text);
    either.fold(
      (error) {
        emit(RegisterErrorState(errors: error));
      },
      (response) {
        emit(RegisterSuccesState(responseEntity: response));
      },
    );
  }
}
