class Product {
  final int id;
  final String name;
  final String description;
  final String photo;
  final int price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
    required this.price
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'name': String name,
      'description': String description,
      'photo': String photo,
      'price': int price,
      } =>
          Product(
            id: id,
            name: name,
            description: description,
            photo: photo,
            price: price,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}