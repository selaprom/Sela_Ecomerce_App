class SearchProduct {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? categoryId;

  SearchProduct({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.categoryId,
  });

  SearchProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    return data;
  }
}
