class CategoryOrBrandResponseEntity {
  int? results;
  MetadataEntity? metadata;
  List<CategoryOrBrandEntity>? data;

  CategoryOrBrandResponseEntity({this.results, this.metadata, this.data});
}

class CategoryOrBrandEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}

class MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});
}
