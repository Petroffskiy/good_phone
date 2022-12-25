import 'package:good_phone/features/data/api/repository/home/api_list_phone.dart';
import 'package:good_phone/features/domain/model/home/all_phones_model.dart';
import 'package:good_phone/features/domain/model/home/phone_best_model.dart';

import '../../domain/model/home/phone_model.dart';

class HomeMapper {
  static AllPhonesModel fromApi(ApiListPhone listPhone) {
    return AllPhonesModel(
      allPhone: List.generate(
        listPhone.homeStore.length,
        (index) => PhoneModel(
          id: listPhone.homeStore[index].id,
          isNew: listPhone.homeStore[index].isNew,
          image: listPhone.homeStore[index].picture,
          isBuy: listPhone.homeStore[index].isBuy,
          namePhone: listPhone.homeStore[index].title,
          descriptionPhone: listPhone.homeStore[index].subtitle,
        ),
      ),
      bestModel: List.generate(
        listPhone.bestSeller.length,
        (index) => PhoneBestModel(
          id: listPhone.bestSeller[index].id,
          name: listPhone.bestSeller[index].title,
          price: listPhone.bestSeller[index].priceWithoutDiscount,
          image: listPhone.bestSeller[index].picture,
          isFavorite: listPhone.bestSeller[index].isFavorites,
          discountPrise: listPhone.bestSeller[index].discountPrice,
        ),
      ),
    );
  }
}
