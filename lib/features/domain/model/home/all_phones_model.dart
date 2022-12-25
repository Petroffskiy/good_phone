import 'package:good_phone/features/domain/model/home/phone_best_model.dart';
import 'package:good_phone/features/domain/model/home/phone_model.dart';

class AllPhonesModel {
  final List<PhoneModel> allPhone;
  final List<PhoneBestModel> bestModel;

  AllPhonesModel({
    required this.allPhone,
    required this.bestModel,
  });
}
