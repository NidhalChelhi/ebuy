class ProductModel {
  String pid, name, description, price, category;
  int rating;
  List<String> images, sizes, colors;

  ProductModel({
    this.pid,
    this.name,
    this.images,
    this.description,
    this.colors,
    this.sizes,
    this.price,
    this.rating,
    this.category,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    pid = map['pid'];
    name = map['name'];
    images = map['images'].cast<String>();
    description = map['description'];
    colors = map['colors'].cast<String>();
    sizes = map['sizes'].cast<String>();
    price = map['price'];
    rating = map['rating'];
    category = map['category'];
  }

  toJson() {
    return {
      'pid': pid,
      'name': name,
      'images': images,
      'description': description,
      'colors': colors,
      'sizes': sizes,
      'price': price,
      'rating': rating,
      'category': category,
    };
  }
}
