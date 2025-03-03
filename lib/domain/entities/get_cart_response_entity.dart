import 'package:ecommerceapp/domain/entities/product_response_entity.dart';

class GetCartResponseEntity {
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetCartDataEntity? data;

  GetCartResponseEntity(
      {this.status, this.numOfCartItems, this.cartId, this.data});
}

class GetCartDataEntity {
  String? id;
  String? cartOwner;
  List<GetCartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  GetCartDataEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class GetCartProductEntity {
  int? count;
  String? id;
  ProductEntity? product;
  int? price;

  GetCartProductEntity({this.count, this.id, this.product, this.price});
}






