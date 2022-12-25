import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:good_phone/features/domain/model/home/all_phones_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../assets/constains.dart';
import '../repository/home/api_list_phone.dart';
import 'dio/dio_client.dart';

// part 'list_phone_service.g.dart';

final String url = dotenv.get('URL_START');


class ListPhoneService {
  final Dio _dio = buildDioClient(base: url);

  Future<ApiListPhone> allPhones()async {
    final response = await _dio.get(Constains.URL_MAIN);
    print(response);
    return ApiListPhone.fromJson(response.data);
  }
}


// @RestApi()
// abstract class ListPhoneService {
//   factory ListPhoneService(Dio dio, {String baseUrl}) = _ListPhoneService;
//
//   @GET(Constains.URL_MAIN)
//   Future<List<ApiListPhone>> getPhones();
//
// // @POST(Constains.URL_PRODUCT_DETAIL)
// // Future<>
// }
