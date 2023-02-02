import '../../model/detail_product/product_detail_model.dart';

abstract class ProductDetailRepository {
  Future<ProductDetailModel> getPhone({required int id});
}