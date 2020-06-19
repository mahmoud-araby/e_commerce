class Product {
  String name;
  String description;
  double price;
  String image;
  String id;

  Product.fromJson(Map json) {
    this.name = json['name'];
    this.price = json['price'].toDouble();
    this.image = json['picture'][0]['url'];
    this.description = json['description'];
    this.id = json['id'];
  }

  Map<String, dynamic> get toJson => {
        'name': this.name,
        'price': this.price,
        'picture': this.image,
        'description': this.description,
      };

  Product({this.name, this.description, this.price, this.image});
}
