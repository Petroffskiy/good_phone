import '../../domain/model/detail_product/product_detail_model.dart';
import '../api/repository/detail_product/api_product_detail.dart';

class ProductDetailMapper {
  static ProductDetailModel fromJson(ApiProductDetail productDetail) {
    return ProductDetailModel(id: productDetail.id,
      cpu: productDetail.cpu,
      ram: productDetail.ssd,
      name: productDetail.title,
      price: productDetail.price,
      memory: productDetail.sd,
      rating: productDetail.rating,
      colors: productDetail.color,
      images: productDetail.images,
      capacity: productDetail.capasity,
      isFavourite: productDetail.isFavourites,
      cameraOption: productDetail.camera,);
  }
}