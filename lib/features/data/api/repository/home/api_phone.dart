import 'package:json_annotation/json_annotation.dart';

part 'api_phone.g.dart';

@JsonSerializable()
class ApiPhoneModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "is_buy")
  final bool isBuy;
  @JsonKey(name: "is_new")
  final bool? isNew;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "picture")
  final String picture;
  @JsonKey(name: "subtitle")
  final String subtitle;

  ApiPhoneModel({
    required this.id,
    required this.title,
    required this.isBuy,
    required this.isNew,
    required this.picture,
    required this.subtitle,
  });

  factory ApiPhoneModel.fromJson(Map<String, dynamic> json){
    print("This is in api_model");
    print(json);
    return ApiPhoneModel(
      id: json['id'],
      title: json['title'],
      isNew: json['is_new'],
      isBuy: json['is_buy'],
      picture: json['picture'],
      subtitle: json['subtitle'],
    );
  }
}
