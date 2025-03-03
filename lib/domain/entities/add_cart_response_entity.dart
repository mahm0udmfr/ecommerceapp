class AddCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  CartDataEntity? data;

  AddCartResponseEntity(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});
}

class CartDataEntity {
  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartDataEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class CartProductEntity {
  int? count;
  String? id;
  String? product;
  int? price;

  CartProductEntity({this.count, this.id, this.product, this.price});
}
