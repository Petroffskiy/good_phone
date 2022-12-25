import 'package:json_annotation/json_annotation.dart';

part 'api_phone_best.g.dart';

@JsonSerializable()
class ApiPhoneBestModel {
  final int id;
  final String title;
  final String picture;
  final bool isFavorites;
  final int discountPrice;
  final int priceWithoutDiscount;

  ApiPhoneBestModel({
    required this.id,
    required this.title,
    required this.picture,
    required this.isFavorites,
    required this.discountPrice,
    required this.priceWithoutDiscount,
  });

  factory ApiPhoneBestModel.fromJson(Map<String, dynamic> json) {
    return ApiPhoneBestModel(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      isFavorites: json['is_favorites'],
      discountPrice: json["discount_price"],
      priceWithoutDiscount: json['price_without_discount'],
    );
  }
}
