import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';

class CategoriesTabModel extends CategoriesTabEntity{
  CategoriesTabModel({
    this.results,
    this.metadata,
    super.data,});

  CategoriesTabModel.fromJson(dynamic json) {
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
    this.sold,
    this.images,
    super.subcategory,
    this.ratingsQuantity,
    super.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.availableColors,
    super.imageCover,
    super.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,});

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    if (json['availableColors'] != null) {
      availableColors = [];
      json['availableColors'].forEach((v) {
        availableColors?.add("");
      });
    }
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? sold;
  List<String>? images;
  num? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  List<dynamic>? availableColors;
  Brand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    if (availableColors != null) {
      map['availableColors'] = availableColors?.map((v) => v.toJson()).toList();
    }
    map['imageCover'] = imageCover;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }

}

class Brand {
  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

class Category extends CategoryEntity {
  Category({
    super.id,
    super.name,
    this.slug,
    this.image,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

class Subcategory extends SubCategoryEntity{
  Subcategory({
    super.id,
    super.name,
    this.slug,
    super.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? slug;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}