import 'package:ecommerceapp/core/di/di.dart';
import 'package:ecommerceapp/core/utils/app_routes.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/dialog_utils.dart';
import 'package:ecommerceapp/core/utils/validators.dart';
import 'package:ecommerceapp/features/ui/auth/Login/cubit/login_states.dart';
import 'package:ecommerceapp/features/ui/auth/Login/cubit/login_view_model.dart';
import 'package:ecommerceapp/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerceapp/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginscreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

LoginViewModel viewModel = getIt<LoginViewModel>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: "Loading...");
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errors.errorMessage,
              posActionName: "Ok",
              title: "Error");
        } else if (state is LoginSuccesState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: "Login Successfully",
              posActionName: "Ok",
              posAction: (){
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              },
                  
              title: "Success");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 91, bottom: 10, left: 97, right: 97),
                  child: Image(image: AssetImage(AppAssets.logo)),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, top: 35.h),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Welcome Back To Route",
                            style: AppStyles.semi24White),
                        Text("please Login with your details",
                            style: AppStyles.light16White),
                        SizedBox(
                          height: 15,
                        ),
                        Text("User Name", style: AppStyles.medium18White),
                        CustomTextFormField(
                          validator: (p0) => AppValidators.validateEmail(
                              viewModel.emailController.text),
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.emailController,
                          hintText: "Enter Your Email",
                          hintStyle: AppStyles.light18HintText,
                        ),
                        Text("Password", style: AppStyles.medium18White),
                        CustomTextFormField(
                          isPassword: true,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          maxLines: 1,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.passwordController,
                          hintText: "Enter Your Password",
                          hintStyle: AppStyles.light18HintText,
                          validator: (p0) => AppValidators.validatePassword(
                              viewModel.passwordController.text),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forget Password?",
                              style: AppStyles.medium18White,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: CustomElevatedButton(
                              textStyle: AppStyles.semi20Primary,
                              backgroundColor: AppColors.whiteColor,
                              text: "Login",
                              onPressed: () {
                                viewModel.login();
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.registerRoute);
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "don't have an account? Sign Up",
                                maxLines: 1,
                                style: AppStyles.medium18White,
                              )),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
