class ProductDetailModel {
  final String id;
  final String cpu;
  final String ram;
  final double rating;
  final String name;
  final int price;
  final String memory;
  final bool isFavourite;
  final List<String> colors;
  final List<String> images;
  final String cameraOption;
  final List<String> capacity;

  const ProductDetailModel({
    required this.id,
    required this.cpu,
    required this.ram,
    required this.name,
    required this.price,
    required this.memory,
    required this.rating,
    required this.colors,
    required this.images,
    required this.capacity,
    required this.isFavourite,
    required this.cameraOption,
  });
}
