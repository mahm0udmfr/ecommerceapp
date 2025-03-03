import 'package:ecommerceapp/core/utils/app_routes.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_screen_view_model.dart';
import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_states.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/cubit/product_tab_states.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/cubit/product_tab_view_model.dart';
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
            appBar: _buildAppBar(viewModel.selectedIndex, context),
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

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }

  PreferredSizeWidget _buildAppBar(int index, BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          style: AppStyles.regular14Text,
                          cursorColor: AppColors.primaryColor,
                          onTap: () {
                            //todo: implement search logic
                          },
                          decoration: InputDecoration(
                              border: _buildCustomBorder(),
                              enabledBorder: _buildCustomBorder(),
                              focusedBorder: _buildCustomBorder(),
                              contentPadding: EdgeInsets.all(16.h),
                              hintStyle: AppStyles.light14SearchHint,
                              hintText: "what do you search for?",
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: AppColors.primaryColor.withOpacity(0.75),
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.cartRoute);
                      },
                      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
                        builder: (context, state) {
                          return Badge(
                            alignment: AlignmentDirectional.topStart,
                            backgroundColor: AppColors.greenColor,
                            label: Text(ProductTabViewModel.get(context)
                                .numberOfCartItems
                                .toString()),
                            child: ImageIcon(
                              const AssetImage(AppAssets.shoppingCart),
                              size: 35.sp,
                              color: AppColors.primaryColor,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
