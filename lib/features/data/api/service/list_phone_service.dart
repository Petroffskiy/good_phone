import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../assets/constains.dart';
import '../repository/home/api_list_phone.dart';
import 'dio/dio_client.dart';

final String url = dotenv.get('URL_START');

class ListPhoneService {
  final Dio _dio = buildDioClient(base: url);

  Future<ApiListPhone> allPhones() async {
    final response = await _dio.get(Constance.URL_MAIN);
    print(response);
    return ApiListPhone.fromJson(response.data);
  }
}
