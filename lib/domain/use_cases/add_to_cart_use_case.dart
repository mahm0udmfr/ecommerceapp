import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/home/home_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  HomeReposatry homeReposatry;

  AddToCartUseCase({required this.homeReposatry});

  Future<Either<Faliurs, AddCartResponseEntity>> invoke(String productId) {
    return homeReposatry.addToCart(productId);
  }
}
