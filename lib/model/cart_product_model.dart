class CartProductModel {
  String pid, name, price, image, size, color;
  int favourite, quantity;

  CartProductModel({
    this.pid,
    this.name,
    this.image,
    this.favourite,
    this.color,
    this.size,
    this.price,
    this.quantity,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    pid = map['pid'];
    name = map['name'];
    image = map['image'];
    favourite = map['favourite'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'pid': pid,
      'name': name,
      'image': image,
      'favourite': favourite,
      'color': color,
      'size': size,
      'price': price,
      'quantity': quantity,
    };
  }
}
