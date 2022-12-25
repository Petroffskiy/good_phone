// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPhoneModel _$ApiPhoneModelFromJson(Map<String, dynamic> json) =>
    ApiPhoneModel(
      id: json['id'] as int,
      title: json['title'] as String,
      isBuy: json['is_buy'] as bool,
      isNew: json['is_new'] as bool?,
      picture: json['picture'] as String,
      subtitle: json['subtitle'] as String,
    );

Map<String, dynamic> _$ApiPhoneModelToJson(ApiPhoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_buy': instance.isBuy,
      'is_new': instance.isNew,
      'title': instance.title,
      'picture': instance.picture,
      'subtitle': instance.subtitle,
    };
