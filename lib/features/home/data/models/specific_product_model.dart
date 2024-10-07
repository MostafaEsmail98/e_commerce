import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';

class SpecificProductModel extends SpecificProductEntity{
  SpecificProductModel({
    super.data,
  });

  SpecificProductModel.fromJson(dynamic json) {
    try {
      data = json['data'] != null ? Data.fromJson(json['data']) : null;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

class Data extends DataEntity{
  Data({
    super.sold,
    super.images,
    this.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    this.quantity,
    super.price,
    super.priceAfterDiscount,
    this.availableColors,
    this.imageCover,
    this.category,
    this.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.reviews,
  });

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
    priceAfterDiscount = json['priceAfterDiscount'];
    if (json['availableColors'] != null) {
      availableColors = [];
      json['availableColors'].forEach((v) {
        availableColors?.add("");
      });
    }
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add("");
      });
    }
  }


  List<Subcategory>? subcategory;
  num? quantity;
  List<dynamic>? availableColors;
  String? imageCover;
  Category? category;
  Brand? brand;
  String? createdAt;
  String? updatedAt;
  num? v;
  List<dynamic>? reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    if (availableColors != null) {
      map['availableColors'] = availableColors?.map((v) => v.toJson()).toList();
    }
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    return map;
  }
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

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

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  Category.fromJson(dynamic json) {
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

class Subcategory {
  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}
