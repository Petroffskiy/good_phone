// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_list_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiListPhone _$ApiListPhoneFromJson(Map<String, dynamic> json) => ApiListPhone(
      homeStore: (json['homeStore'] as List<dynamic>)
          .map((e) => ApiPhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSeller: (json['bestSeller'] as List<dynamic>)
          .map((e) => ApiPhoneBestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiListPhoneToJson(ApiListPhone instance) =>
    <String, dynamic>{
      'homeStore': instance.homeStore,
      'bestSeller': instance.bestSeller,
    };
