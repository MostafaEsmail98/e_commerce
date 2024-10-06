class BrandsEntity {
  List<DataEntity>? data;

  BrandsEntity({this.data});
}

class DataEntity {
  String? name;

  String? id;
  String? image;

  DataEntity({this.name, this.id, this.image});
}
