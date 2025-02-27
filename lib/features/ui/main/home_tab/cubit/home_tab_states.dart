import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/category_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class BrandsLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  Faliurs faliurs;

  CategoryErrorState({required this.faliurs});
}

class BrandsErrorState extends HomeTabStates {
  Faliurs faliurs;

  BrandsErrorState({required this.faliurs});
}

class BrandsSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity brandResponseEntity;
  BrandsSuccessState({required this.brandResponseEntity});
}

class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}
