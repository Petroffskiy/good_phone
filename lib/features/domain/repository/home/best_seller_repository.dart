class BestSellerRepository {
  final int id;
  bool isFavourite;
  final String name;
  final String description;
  final String image;
  final bool isBuy;

  BestSellerRepository({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.isBuy,
    required this.isFavourite,
  });
}
