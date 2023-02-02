import 'package:good_phone/features/domain/repository/product_detail/product_detail_repository.dart';

import '../model/detail_product/product_detail_model.dart';



class GetProductDetailUsecase {
  final ProductDetailRepository repository;

  GetProductDetailUsecase(this.repository);

  Future<ProductDetailModel> getProductDetail({required int id}) {
    return repository.getPhone(id: id);
  }
}