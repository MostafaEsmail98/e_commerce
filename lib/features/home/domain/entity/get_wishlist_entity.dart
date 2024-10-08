class GetWishlistEntity {
  List<DataEntity>? data ;

  GetWishlistEntity({this.data});
}
class DataEntity {
  String? id ;
  String? title;
  String? imageCover;
  num? price;

  DataEntity({this.id, this.title, this.imageCover, this.price});
}