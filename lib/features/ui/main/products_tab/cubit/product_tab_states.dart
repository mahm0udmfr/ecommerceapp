import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';

abstract class ProductTabStates {}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabErrorState extends ProductTabStates {
  Faliurs failures;

  ProductTabErrorState({required this.failures});
}

class ProductTabSuccessState extends ProductTabStates {
  ProductResponseEntity responseEntity;

  ProductTabSuccessState({required this.responseEntity});
}

class AddToCartLoadingState extends ProductTabStates {}

class AddToCartErrorState extends ProductTabStates {
  Faliurs failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductTabStates {
  AddCartResponseEntity responseEntity;

  AddToCartSuccessState({required this.responseEntity});
}
