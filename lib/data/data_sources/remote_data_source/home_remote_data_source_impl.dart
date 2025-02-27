import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/end_points.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/data/model/category_response_dm.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Faliurs, CategoryOrBrandResponseDm>> getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllCategories);
        var categoryResponse =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return left(ServerFaliure(errorMessage: categoryResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliurs, CategoryOrBrandResponseDm>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllBrands);
        var brandsResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return left(ServerFaliure(errorMessage: brandsResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }
}
