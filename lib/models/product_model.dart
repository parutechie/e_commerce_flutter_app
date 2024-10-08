class ProductModel {
  final int id;
  final String title;
  final String description;
  final String? rating;
  final double price;
  final double discountPercentage;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.discountPercentage,
    required this.imageUrl,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rating: json['rating'].toString(),
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      imageUrl: json['thumbnail'],
      category: json['category'],
    );
  }
}
