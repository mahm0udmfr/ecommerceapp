import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/cart/cart_reposatry.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartReposatry)
class CartReposatryImpl implements CartReposatry {
  CartRemoteDataSource cartRemoteDataSource;
  CartReposatryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Faliurs, GetCartResponseEntity>> getItemsInCart() async{
    var either = await cartRemoteDataSource.getItemsInCart();
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
  
  @override
  Future<Either<Faliurs, GetCartResponseEntity>> deleteItemsInCart(String productId)async {
      var either = await cartRemoteDataSource.deleteItemsInCart(productId);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
  
  @override
  Future<Either<Faliurs, GetCartResponseEntity>> updateCountInCart(String productId, int count) async{
      var either = await cartRemoteDataSource.updateCountInCart(productId,count);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }




}
