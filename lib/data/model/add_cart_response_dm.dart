import 'package:ecommerceapp/domain/entities/add_cart_response_entity.dart';

class AddCartResponseDm extends AddCartResponseEntity {
  String? statusMsg;

  AddCartResponseDm(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
      this.statusMsg});

  AddCartResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    statusMsg = json["statusMsg"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] == null ? null : CartDataDm.fromJson(json["data"]);
  }

  static List<AddCartResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(AddCartResponseDm.fromJson).toList();
  }
}

class CartDataDm extends CartDataEntity {


  CartDataDm(
      {super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice});

  CartDataDm.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => CartProductDm.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

  static List<CartDataDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartDataDm.fromJson).toList();
  }


}

class CartProductDm extends CartProductEntity {


  CartProductDm({super.count, super.id, super.product, super.price});

  CartProductDm.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"];
    price = json["price"];
  }

  static List<CartProductDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartProductDm.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["_id"] = id;
    data["product"] = product;
    data["price"] = price;
    return data;
  }
}
