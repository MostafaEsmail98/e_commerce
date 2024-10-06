import 'package:e_commrece/features/home/domain/entity/brands_entity.dart';

class BrandsModel extends BrandsEntity{
  BrandsModel({
    this.results,
    this.metadata,
    super.data,});

  BrandsModel.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    return map;
  }

}

class Data extends DataEntity{
  Data({
    super.id,
    super.image,
    super.name,
    this.slug,
    this.createdAt,
    this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? slug;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }

}