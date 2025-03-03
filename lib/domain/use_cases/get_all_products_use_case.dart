import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/home/home_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  HomeReposatry homeReposatry;

  GetAllProductsUseCase({required this.homeReposatry});

  Future<Either<Faliurs, ProductResponseEntity>> invoke() {
    return homeReposatry.getAllProducts();
  }
}
