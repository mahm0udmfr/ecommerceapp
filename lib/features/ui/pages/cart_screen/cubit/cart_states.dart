import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Faliurs failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemsInCartLoadingState extends CartStates {}

class DeleteItemsInCartErrorState extends CartStates {
  Faliurs failures;

  DeleteItemsInCartErrorState({required this.failures});
}

class DeleteItemsInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemsInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Faliurs failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
