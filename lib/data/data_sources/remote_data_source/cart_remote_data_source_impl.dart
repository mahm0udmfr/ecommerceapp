import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/end_points.dart';
import 'package:ecommerceapp/core/errors/faliurs.dart';
import 'package:ecommerceapp/data/model/get_cart_response_dm.dart';
import 'package:ecommerceapp/domain/reposatries/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerceapp/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Faliurs, GetCartResponseDm>> getItemsInCart() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
            endPoint: EndPoints.addToCart,
            headers: {"token": MyServices.getString("token")});
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return left(ServerFaliure(errorMessage: getCartResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliurs, GetCartResponseDm>> deleteItemsInCart(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.deleteData(
            endPoint: "${EndPoints.addToCart}/$productId",
            headers: {"token": MyServices.getString("token")});
        var deleteCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else {
          return left(ServerFaliure(errorMessage: deleteCartResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliurs, GetCartResponseDm>> updateCountInCart(String productId, int count) async{
      try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.updateData(
            endPoint: "${EndPoints.addToCart}/$productId",
            body: {"count": count.toString()},
            headers: {"token": MyServices.getString("token")});
        var updateCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCartResponse);
        } else {
          return left(ServerFaliure(errorMessage: updateCartResponse.message!));
        }
      } else {
        return left(NetworkFaliure(errorMessage: "No InterNet Connection"));
      }
    } catch (e) {
      return left(Faliurs(errorMessage: e.toString()));
    }
  }
}
