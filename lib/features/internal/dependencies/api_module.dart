
import 'package:good_phone/features/data/api/ApiUtil.dart';
import 'package:good_phone/features/data/api/service/list_phone_service.dart';

class ApiModule {
  static ApiUtil _apiUtil = ApiUtil(ListPhoneService());


  static ApiUtil apiUtil(){
    if (_apiUtil == null){
      _apiUtil = ApiUtil(ListPhoneService());
    }
    return _apiUtil;
  }
}