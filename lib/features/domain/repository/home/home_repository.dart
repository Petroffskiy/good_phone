import 'package:good_phone/features/domain/model/home/all_phones_model.dart';

abstract class HomeRepository {
  Future<AllPhonesModel> allPhones();
}