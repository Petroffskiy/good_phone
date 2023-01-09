
import 'package:good_phone/features/data/api/repository/home/api_phone.dart';
import 'package:json_annotation/json_annotation.dart';
import 'api_phone_best.dart';

part 'api_list_phone.g.dart';

@JsonSerializable()
class ApiListPhone {
  List<ApiPhoneModel> homeStore;
  List<ApiPhoneBestModel> bestSeller;

  ApiListPhone({
    required this.homeStore,
    required this.bestSeller,
  });

  factory ApiListPhone.fromJson(Map<String, dynamic> json) {
    return ApiListPhone(
      homeStore: List.generate(
        json['home_store'].length,
        (index) => ApiPhoneModel(
          id: json['home_store'][index]['id'],
          title: json['home_store'][index]['title'],
          isBuy: json['home_store'][index]['is_buy'],
          isNew: json['home_store'][index]['is_new'],
          picture: json['home_store'][index]['picture'],
          subtitle: json['home_store'][index]['subtitle'],
        ),
      ),
      bestSeller: List.generate(
        json['best_seller'].length,
        (index) => ApiPhoneBestModel(
          id: json['best_seller'][index]['id'],
          title: json['best_seller'][index]['title'],
          picture: json['best_seller'][index]['picture'],
          isFavorites: json['best_seller'][index]['is_favorites'],
          discountPrice: json['best_seller'][index]['discount_price'],
          priceWithoutDiscount: json['best_seller'][index]
              ['price_without_discount'],
        ),
      ),
    );
  }
}