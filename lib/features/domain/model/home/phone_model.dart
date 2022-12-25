
class PhoneModel {
  final int id;
  final bool? isNew;
  final bool isBuy;
  final String image;
  final String namePhone;
  final String descriptionPhone;

  PhoneModel({
    required this.id,
    required this.isNew,
    required this.image,
    required this.isBuy,
    required this.namePhone,
    required this.descriptionPhone,
  });
}
