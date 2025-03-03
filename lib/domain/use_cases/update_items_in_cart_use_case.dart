import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/cart/cart_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateItemsInCartUseCase {
  CartReposatry cartReposatry;

  UpdateItemsInCartUseCase(this.cartReposatry);

  Future<Either<Faliurs, GetCartResponseEntity>> invoke(String productId,int count) {
    return cartReposatry.updateCountInCart(productId, count);
  }
}
