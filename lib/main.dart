import 'package:ecommerceapp/core/di/di.dart';
import 'package:ecommerceapp/core/utils/app_routes.dart';
import 'package:ecommerceapp/core/utils/my_bloc_observer.dart';
import 'package:ecommerceapp/features/ui/auth/register/register_screen.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/cubit/product_tab_view_model.dart';
import 'package:ecommerceapp/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerceapp/services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/features/ui/homeScreen/home_screen.dart';
import 'package:ecommerceapp/core/utils/apptheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/ui/auth/Login/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await MyServices.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<ProductTabViewModel>()),
    BlocProvider(create: (context) => getIt<CartViewModel>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            theme: Apptheme.lightTheme,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            routes: {
              AppRoutes.homeRoute: (context) => HomeScreen(),
              AppRoutes.loginRoute: (context) => LoginScreen(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
            },
            initialRoute: MyServices.getString("token") == null
                ? AppRoutes.loginRoute
                : AppRoutes.homeRoute);
      },
    );
  }
}
