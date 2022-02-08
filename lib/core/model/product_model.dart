class Product {
  String? productId;
  String? productName;
  String? productDesc;
  String? price;
  String? rating;
  String? imageUrl;
  Product(
      {this.productId,
      this.productName,
      this.productDesc,
      this.price,
      this.rating,
      this.imageUrl});

       factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productName: json['productname'],
        productId: json['productid'],
        productDesc: json['description'],
        rating: json['rating'],
        price: json['price'],
        imageUrl: json['imageUrl']
        );
  }

  Map<String, dynamic> toJson(Product model) {
    return {
     'productname':model.productName,
     'productid':model.productId,
     'description':model.productDesc,
     'rating':model.rating,
     'price':model.price,
     'imageUrl':model.imageUrl,
    };
  }
}
