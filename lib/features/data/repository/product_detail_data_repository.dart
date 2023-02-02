import 'package:good_phone/features/data/api/ApiUtil.dart';

import '../../domain/model/detail_product/product_detail_model.dart';
import '../../domain/repository/product_detail/product_detail_repository.dart';

class ProductDetailDataRepository extends ProductDetailRepository {
  final ApiUtil _apiUtil;

  ProductDetailDataRepository(this._apiUtil);

  @override
  Future<ProductDetailModel> getPhone({required int id}) {
    return _apiUtil.getDetail(id: id);
  }
}