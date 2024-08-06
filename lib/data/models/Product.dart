
class Product {
  final int? id;
  final String name;
  final String description;
  final double? price;
  

  Product({
    this.id,
    required this.name,
    required this.description,
    this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

}
