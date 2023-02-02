
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:good_phone/assets/constains.dart';
import 'package:good_phone/features/data/api/request/get_product_detail_body.dart';
import 'package:good_phone/features/data/api/service/dio/dio_client.dart';

import '../../repository/detail_product/api_product_detail.dart';

final String url = dotenv.get('URL_START');

class DetailProductService {
    final Dio _dio = buildDioClient(base: url);

    Future<ApiProductDetail>  getDetail(GetProductDetailBody body) async {
        final response = await _dio.get(Constance.URL_PRODUCT_DETAIL);
        print('this is body for request: $body');
        print(response);
        return ApiProductDetail.fromJson(response.data);
    }

}