import 'package:ecommerceapp/domain/entities/category_response_entity.dart';

class ProductResponseEntity {
  num? results;
  ProductMetadataEntity? metadata;
  List<ProductEntity>? data;

  ProductResponseEntity({this.results, this.metadata, this.data});
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductEntity(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt});
}

class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.id, this.name, this.slug, this.category});
}

class ProductMetadataEntity {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  ProductMetadataEntity(
      {this.currentPage, this.numberOfPages, this.limit, this.nextPage});
}
