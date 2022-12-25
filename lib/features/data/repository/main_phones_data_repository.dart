import 'package:good_phone/features/data/api/ApiUtil.dart';
import 'package:good_phone/features/domain/model/home/all_phones_model.dart';
import 'package:good_phone/features/domain/model/home/phone_model.dart';
import 'package:good_phone/features/domain/repository/home/home_repository.dart';

//TODO класс необходим для подтяжки данных с экрана и передачи на сервер
class MainPhoneDataRepository extends HomeRepository {
  final ApiUtil _apiUtil;

  MainPhoneDataRepository(this._apiUtil);

  @override
  Future<AllPhonesModel> allPhones() {
    return _apiUtil.allPhones();
  }
}