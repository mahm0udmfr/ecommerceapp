import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_screen_view_model.dart';
import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                AppAssets.onTopLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            body: IndexedStack(
              index: viewModel.selectedIndex,
              children: viewModel.tabs,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: viewModel.bottomNavigationBarOnTap,
              unselectedItemColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.blackColor,
              currentIndex: viewModel.selectedIndex,
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.homeIcon),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.searchIcon),
                    ),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.browseIcon),
                    ),
                    label: "Favorites"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(AppAssets.profileIcon),
                    ),
                    label: "Profile"),
              ],
            ),
          );
        });
  }
}
