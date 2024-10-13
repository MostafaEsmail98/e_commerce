class CartEntity {
  CartEntity({
    this.numOfCartItems,
    this.cartId,
    this.data,
    this.message
  });



  num? numOfCartItems;
  String? cartId;
  DataEntity? data;
  String? message;


}

class DataEntity {
  DataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.totalCartPrice,
  });



  String? id;
  String? cartOwner;
  List<ProductsEntity>? products;
  num? totalCartPrice;

}

class ProductsEntity {
  ProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });



  num? count;
  String? id;
  ProductEntity? product;
  num? price;


}

class ProductEntity {
  ProductEntity({
    this.id,
    this.title,
    this.imageCover,
  });

  String? id;
  String? title;
  String? imageCover;

}

