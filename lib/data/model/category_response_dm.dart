import 'package:ecommerceapp/domain/entities/category_response_entity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  String? statusMsg;
  String? message;
  CategoryOrBrandResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.statusMsg,
      this.message});

  CategoryOrBrandResponseDm.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    statusMsg = json["statusMsg"];
    message = json["message"];
    metadata =
        json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => CategoryOrBrandDm.fromJson(e)).toList();
  }

  static List<CategoryOrBrandResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryOrBrandResponseDm.fromJson).toList();
  }
}

class CategoryOrBrandDm extends CategoryOrBrandEntity {
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandDm(
      {super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  CategoryOrBrandDm.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  static List<CategoryOrBrandDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryOrBrandDm.fromJson).toList();
  }
}

class Metadata extends MetadataEntity {
  Metadata({super.currentPage, super.numberOfPages, super.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
  }

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }
}
