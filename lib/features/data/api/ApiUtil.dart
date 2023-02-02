import 'package:good_phone/features/data/api/request/get_product_detail_body.dart';
import 'package:good_phone/features/data/api/service/list_phone_service.dart';
import 'package:good_phone/features/data/mapper/home_mapper.dart';
import 'package:good_phone/features/data/mapper/product_detail_mapper.dart';
import '../../domain/model/detail_product/product_detail_model.dart';

import '../../domain/model/home/all_phones_model.dart';
import 'service/detail_product/detail_product_service.dart';

class ApiUtil {
  final ListPhoneService _listPhoneService;
  final DetailProductService _detailProductService;

  ApiUtil(this._listPhoneService, this._detailProductService);

  Future<AllPhonesModel> allPhones() async {
    final result = await _listPhoneService.allPhones();
    // print(result);
    return HomeMapper.fromApi(result);
  }
  Future<ProductDetailModel> getDetail({required int id}) async  {
    final body = GetProductDetailBody(id: id);
    final response = await _detailProductService.getDetail(body);
    return ProductDetailMapper.fromJson(response);
  }
}
