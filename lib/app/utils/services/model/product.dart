part of rest_api_service;

class Product {
  final String id;
  final List<ImageProvider> images;
  final String brand;
  final String name;
  final double price;
  final String description;

  const Product({
    required this.id,
    required this.images,
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
  });
}
