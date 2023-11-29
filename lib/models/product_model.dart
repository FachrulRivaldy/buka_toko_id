// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final double rate;
  final int count;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rate,
    required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      rate: json['rating']['rate'].toDouble(),
      count: json['rating']['count'],
    );
  }
}
