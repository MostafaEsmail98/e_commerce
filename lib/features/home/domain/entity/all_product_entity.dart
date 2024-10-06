class AllProductEntity {
  List <DataEntity>? data ;

  AllProductEntity({this.data});
}

class DataEntity {
  String? imageCover ;
  String? title ;
  String? id;
  num? ratingsAverage;
  num? price;

  DataEntity({this.imageCover, this.title, this.id,this.ratingsAverage,this.price});
}