// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_phone_best.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPhoneBestModel _$ApiPhoneBestModelFromJson(Map<String, dynamic> json) =>
    ApiPhoneBestModel(
      id: json['id'] as int,
      title: json['title'] as String,
      picture: json['picture'] as String,
      isFavorites: json['isFavorites'] as bool,
      discountPrice: json['discountPrice'] as int,
      priceWithoutDiscount: json['priceWithoutDiscount'] as int,
    );

Map<String, dynamic> _$ApiPhoneBestModelToJson(ApiPhoneBestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'picture': instance.picture,
      'isFavorites': instance.isFavorites,
      'discountPrice': instance.discountPrice,
      'priceWithoutDiscount': instance.priceWithoutDiscount,
    };
