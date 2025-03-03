import 'package:ecommerceapp/data/model/category_response_dm.dart';
import 'package:ecommerceapp/domain/entities/product_response_entity.dart';

class ProductResponseDm extends ProductResponseEntity {
  String? statusMsg;
  String? message;

  ProductResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  ProductResponseDm.fromJson(Map<String, dynamic> json) {
    statusMsg = json["statusMsg"];
    message = json["message"];
    results = json["results"];
    metadata = json["metadata"] == null
        ? null
        : ProductMetadataDm.fromJson(json["metadata"]);
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => ProductDm.fromJson(e)).toList();
  }

  static List<ProductResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductResponseDm.fromJson).toList();
  }
}

class ProductDm extends ProductEntity {
  ProductDm(
      {super.sold,
      super.images,
      super.subcategory,
      super.ratingsQuantity,
      super.id,
      super.title,
      super.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.createdAt,
      super.updatedAt});

  ProductDm.fromJson(Map<String, dynamic> json) {
    sold = json["sold"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    subcategory = json["subcategory"] == null
        ? null
        : (json["subcategory"] as List)
            .map((e) => SubcategoryDm.fromJson(e))
            .toList();
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] == null
        ? null
        : CategoryOrBrandDm.fromJson(json["category"]);
    brand = json["brand"] == null
        ? null
        : CategoryOrBrandDm.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<ProductDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductDm.fromJson).toList();
  }
}

class SubcategoryDm extends SubcategoryEntity {
  SubcategoryDm({super.id, super.name, super.slug, super.category});

  SubcategoryDm.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }

  static List<SubcategoryDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubcategoryDm.fromJson).toList();
  }
}

class ProductMetadataDm extends ProductMetadataEntity {
  ProductMetadataDm(
      {super.currentPage, super.numberOfPages, super.limit, super.nextPage});

  ProductMetadataDm.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  static List<ProductMetadataDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductMetadataDm.fromJson).toList();
  }
}
