class PhoneBestModel {
  final int id;
  final int price;
  final String name;
  final String image;
   bool isFavourite;
  final int discountPrise;

  PhoneBestModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isFavourite,
    required this.discountPrise,
  });
}
