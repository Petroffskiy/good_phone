import 'package:good_phone/features/data/api/ApiUtil.dart';
import 'package:good_phone/features/data/repository/product_detail_data_repository.dart';
import 'package:good_phone/features/domain/repository/product_detail/product_detail_repository.dart';
import 'package:good_phone/features/internal/dependencies/api_module.dart';

class ProductDetailModule {
  static ProductDetailRepository? _productDetailRepository;

  static ProductDetailRepository? productDetailRepository() {
    if (_productDetailRepository == null) {
      _productDetailRepository = ProductDetailDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _productDetailRepository;
  }
}
