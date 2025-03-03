import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';

abstract class CartReposatry {
  
  Future<Either<Faliurs, GetCartResponseEntity>> getItemsInCart();
Future<Either<Faliurs, GetCartResponseEntity>> deleteItemsInCart(String productId);
Future<Either<Faliurs, GetCartResponseEntity>> updateCountInCart(String productId, int count);
}