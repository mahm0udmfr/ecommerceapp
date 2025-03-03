import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/add_cart_response_entity.dart';
import 'package:ecommerceapp/domain/entities/category_response_entity.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Faliurs, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Faliurs, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Faliurs, ProductResponseEntity>> getAllProducts();
  Future<Either<Faliurs, AddCartResponseEntity>> addToCart(String productId);
}
