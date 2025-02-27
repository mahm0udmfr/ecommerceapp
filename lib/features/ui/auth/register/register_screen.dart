import 'package:ecommerceapp/core/di/di.dart';
import 'package:ecommerceapp/core/utils/app_routes.dart';
import 'package:ecommerceapp/core/utils/dialog_utils.dart';
import 'package:ecommerceapp/features/ui/auth/register/cubit/register_states.dart';
import 'package:ecommerceapp/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerceapp/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

RegisterViewModel viewModel = getIt<RegisterViewModel>();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: "Loading...");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errors.errorMessage,
              posActionName: "Ok",
              title: "Error");
        } else if (state is RegisterSuccesState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: "Register Successfully",
              posActionName: "Ok",
              title: "Success");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              spacing: height * .013,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 10.h, left: 97.w, right: 97.w),
                  child: Image(image: AssetImage(AppAssets.logo)),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Full Name", style: AppStyles.medium18White),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.nameController,
                          hintText: "Enter Your Full Name",
                          hintStyle: AppStyles.light18HintText,
                        ),
                        Text("Mobile Number", style: AppStyles.medium18White),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.phoneNumberController,
                          hintText: "Enter Your Mobile Number",
                          hintStyle: AppStyles.light18HintText,
                        ),
                        Text("Email Address", style: AppStyles.medium18White),
                        CustomTextFormField(
                          isPassword: false,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.emailController,
                          hintText: "Enter Your Email Address",
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
                        ),
                        Text("confirm Password",
                            style: AppStyles.medium18White),
                        CustomTextFormField(
                          isPassword: true,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          maxLines: 1,
                          filledColor: AppColors.whiteColor,
                          controller: viewModel.confirmPasswordController,
                          hintText: "Enter Your confirm Password",
                          hintStyle: AppStyles.light18HintText,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: CustomElevatedButton(
                              textStyle: AppStyles.semi20Primary,
                              backgroundColor: AppColors.whiteColor,
                              text: "Sign Up",
                              onPressed: () {
                                viewModel.register();
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.loginRoute);
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "Already have an account? Login",
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
