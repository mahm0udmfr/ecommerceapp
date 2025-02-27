import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/domain/entities/category_response_entity.dart';
import 'package:ecommerceapp/domain/reposatries/home/home_reposatry.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  HomeReposatry homeReposatry;

  GetAllBrandsUseCase({required this.homeReposatry});

  Future<Either<Faliurs, CategoryOrBrandResponseEntity>> invoke() {
    return homeReposatry.getAllBrands();
  }
}
