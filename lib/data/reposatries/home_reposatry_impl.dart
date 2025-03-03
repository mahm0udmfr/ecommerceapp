import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerceapp/domain/entities/category_response_entity.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerceapp/domain/reposatries/home/home_reposatry.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeReposatry)
class HomeReposatryImpl implements HomeReposatry {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeReposatryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Faliurs, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }

  @override
  Future<Either<Faliurs, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }

  @override
  Future<Either<Faliurs, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }

  @override
  Future<Either<Faliurs, AddCartResponseEntity>> addToCart(String productId) async{
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
