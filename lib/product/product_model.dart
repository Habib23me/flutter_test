class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      id: map['id'],
      title: map['title'],
      price: (map['price'] as num).toDouble(),
      category: map['category'],
      description: map['description'],
      image: map['image'],
    );
  }
}
