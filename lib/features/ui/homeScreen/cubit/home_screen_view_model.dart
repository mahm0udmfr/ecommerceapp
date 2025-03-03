import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_states.dart';
import 'package:ecommerceapp/features/ui/main/home_tab/home_tab.dart';
import 'package:ecommerceapp/features/ui/main/products_tab/products_tab.dart';
import 'package:ecommerceapp/features/ui/main/profile_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), ProductsTab(), Container(), UserTab()];

  void bottomNavigationBarOnTap(int index) {
    selectedIndex = index;
    emit(HomeChangeSelectedIndexState());
  }
}
