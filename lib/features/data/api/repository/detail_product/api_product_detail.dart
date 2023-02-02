import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiProductDetail {
  int price;
  String id;
  String sd;
  String ssd;
  double rating;
  String cpu;
  String title;
  String camera;
  bool isFavourites;
  List<String> color;
  List<String> images;
  List<String> capasity;

  ApiProductDetail({
    required this.id,
    required this.sd,
    required this.cpu,
    required this.ssd,
    required this.color,
    required this.title,
    required this.price,
    required this.camera,
    required this.rating,
    required this.images,
    required this.capasity,
    required this.isFavourites,
  });

  factory ApiProductDetail.fromJson(Map<String, dynamic> json) {
    return ApiProductDetail(
      id: json['id'],
      sd: json['sd'],
      ssd: json['ssd'],
      cpu: json['CPU'],
      price: json['price'],
      title: json['title'],
      rating: json['rating'],
      camera: json['camera'],
      color: List.generate(
        json['color'].length,
        (index) => json['color'][index],
      ),
      images: List.generate(
        json['images'].length,
        (index) => json['images'][index],
      ),
      capasity: List.generate(
        json['capacity'].length,
        (index) => json['capacity'][index],
      ), isFavourites: json['isFavorites'],
    );
  }
}
