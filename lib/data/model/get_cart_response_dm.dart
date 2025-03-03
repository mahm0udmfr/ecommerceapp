import 'package:ecommerceapp/data/model/product_response_dm.dart';
import 'package:ecommerceapp/domain/entities/get_cart_response_entity.dart';

class GetCartResponseDm extends GetCartResponseEntity {

  String? message;
  String? statusMsg;


  GetCartResponseDm({super.status, super.numOfCartItems, super.cartId, super.data , this.message, this.statusMsg});

  GetCartResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] == null ? null : GetCartDataDm.fromJson(json["data"]);
  }

  static List<GetCartResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartResponseDm.fromJson).toList();
  }
}

class GetCartDataDm extends GetCartDataEntity {
  

  GetCartDataDm(
      {super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice});

  GetCartDataDm.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => GetCartProductDm.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

  static List<GetCartDataDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartDataDm.fromJson).toList();
  }

}

class GetCartProductDm extends GetCartProductEntity{


  GetCartProductDm({super.count, super.id, super.product, super.price});

  GetCartProductDm.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product =
        json["product"] == null ? null : ProductDm.fromJson(json["product"]);
    price = json["price"];
  }

  static List<GetCartProductDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetCartProductDm.fromJson).toList();
  }


}

