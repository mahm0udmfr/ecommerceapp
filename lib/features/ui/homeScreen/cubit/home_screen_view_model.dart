import 'package:ecommerceapp/features/ui/homeScreen/cubit/home_states.dart';
import 'package:ecommerceapp/features/ui/main/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), Container(), Container(), Container()];

  void bottomNavigationBarOnTap(int index) {
    selectedIndex = index;
    emit(HomeChangeSelectedIndexState());
  }
}
