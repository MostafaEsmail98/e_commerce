class CategoriesTabEntity {
  List<DataEntity>? data;

  CategoriesTabEntity({this.data});
}

class DataEntity {
  List<SubCategoryEntity>? subcategory;
  String? id;
  String? imageCover;
  CategoryEntity? category;
  DataEntity({this.subcategory, this.id, this.imageCover, this.category});
}

class SubCategoryEntity {
  String? id;
  String? name;
  String? category;

  SubCategoryEntity({this.id, this.name, this.category});
}

class CategoryEntity {
  String? id ;
  String? name;
  CategoryEntity({this.name,this.id});
}
