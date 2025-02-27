import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/di/di.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/utils/colors.dart';
import 'package:ecommerceapp/features/ui/main/home_tab/cubit/home_tab_states.dart';

import 'package:ecommerceapp/features/ui/main/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerceapp/features/ui/main/home_tab/widgets/custom_category_widget.dart';
import 'package:ecommerceapp/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  final HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      borderColor: AppColors.primaryColor,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      filledColor: AppColors.whiteColor,
                      hintText: "What do you search for?",
                      hintStyle: AppStyles.light18HintText,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppAssets.shoppingCart))
                ],
              ),
              CarouselSlider(
                  items: [
                    Image.asset(AppAssets.slider1),
                    Image.asset(AppAssets.slider2),
                    Image.asset(AppAssets.slider3)
                  ],
                  options: CarouselOptions(
                    height: 150.h,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: AppStyles.medium18Primary,
                  ),
                  Text(
                    "View all",
                    style: AppStyles.medium14LightPrimary,
                  ),
                ],
              ),
              BlocBuilder<HomeTabViewModel, HomeTabStates>(
                  builder: (context, state) {
                    if (state is CategoryLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.blueColor,
                      ));
                    } else if (state is CategoryErrorState) {
                      return Center(child: Text(state.faliurs.errorMessage));
                    } else {
                      return SizedBox(
                        height: 240.h,
                        child: GridView.builder(
                          itemCount: viewModel.categoriesList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.15.r,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              image: viewModel.categoriesList[index].image!,
                              title: viewModel.categoriesList[index].name!,
                            );
                          },
                        ),
                      );
                    }
                  },
                  bloc: viewModel..getAllCategories()),
              Text(
                "Brands",
                style: AppStyles.medium18Primary,
              ),
              BlocBuilder<HomeTabViewModel, HomeTabStates>(
                  builder: (context, state) {
                    if (state is BrandsLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.blueColor,
                      ));
                    } else if (state is BrandsErrorState) {
                      return Center(child: Text(state.faliurs.errorMessage));
                    } else {
                      return SizedBox(
                        height: 240.h,
                        child: GridView.builder(
                          itemCount: viewModel.brandsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.15.r,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              image: viewModel.brandsList[index].image!,
                              title: viewModel.brandsList[index].name!,
                            );
                          },
                        ),
                      );
                    }
                  },
                  bloc: viewModel..getAllBrands()),
            ],
          ),
        ),
      ),
    );
  }
}
