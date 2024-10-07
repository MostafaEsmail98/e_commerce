class SpecificProductEntity {
  DataEntity? data;

  SpecificProductEntity({this.data});
}

class DataEntity {
  DataEntity({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.priceAfterDiscount,
    this.ratingsAverage,
  });

  num? sold;
  List<String>? images;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? price;
  num? priceAfterDiscount;
  num? ratingsAverage;
}
