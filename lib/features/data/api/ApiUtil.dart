import 'package:good_phone/features/data/api/service/list_phone_service.dart';
import 'package:good_phone/features/data/mapper/home_mapper.dart';

import '../../domain/model/home/all_phones_model.dart';

class ApiUtil {
  final ListPhoneService _listPhoneService;

  ApiUtil(this._listPhoneService);

  Future<AllPhonesModel> allPhones() async {
    final result = await _listPhoneService.allPhones();
    // print(result);
    return HomeMapper.fromApi(result);
  }
}
