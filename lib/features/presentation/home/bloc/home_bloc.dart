import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:good_phone/features/domain/model/home/all_phones_model.dart';
import 'package:good_phone/features/domain/repository/home/filter_option_repository.dart';

import '../../../domain/model/home/phone_best_model.dart';
import '../../../domain/model/home/phone_model.dart';
import '../../../domain/usecase/get_home_phone.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomePhone _allPhones;

  HomeBloc(this._allPhones) : super(HomeEmpty()) {
    on<GetHomePhones>(
      (event, emit) async {
        emit(HomeLoading());
        final allPhonesResult = await _allPhones.allPhones();
        if (allPhonesResult != null) {
          emit(
            HomeDownload(
              phones: FilterOptions.phone,
              price: FilterOptions.price,
              titles: FilterOptions.title,
              allPhones: allPhonesResult,
              phoneMain: await parseHomePhone(allPhonesResult: allPhonesResult),
              bestSeller:
                  await parseHomeBestPhone(allPhonesResult: allPhonesResult),
            ),
          );
        } else {
          emit(HomeError());
        }
      },
    );
  }
}

Future<List<PhoneModel>> parseHomePhone(
    {required AllPhonesModel allPhonesResult}) async {
  List<PhoneModel> finalPhone = [];
  for (int i = 0; i < allPhonesResult.allPhone.length; i++) {
    File _image = await DefaultCacheManager()
        .getSingleFile(allPhonesResult.allPhone[i].image);
    finalPhone.add(
      PhoneModel(
        id: allPhonesResult.allPhone[i].id,
        namePhone: allPhonesResult.allPhone[i].namePhone,
        isBuy: allPhonesResult.allPhone[i].isBuy,
        isNew: allPhonesResult.allPhone[i].isNew,
        descriptionPhone: allPhonesResult.allPhone[i].descriptionPhone,
        image: _image.path,
      ),
    );
    print("this is $i api model ${finalPhone[i].image}");
  }
  return finalPhone;
}

Future<List<PhoneBestModel>> parseHomeBestPhone(
    {required AllPhonesModel allPhonesResult}) async {
  List<PhoneBestModel> finalPhoneBest = [];
  for (int i = 0; i < allPhonesResult.bestModel.length; i++) {
    //TODO: в данноом месте происходи подмена фотографии, так как прилетающая с сервера  указана со стороннего сайта и выдаёт 502 ошибку
    if (i == 2 || i == 1) {
      finalPhoneBest.add(
        PhoneBestModel(
          id: allPhonesResult.bestModel[i].id,
          name: allPhonesResult.bestModel[i].name,
          image:
              "https://i.pinimg.com/originals/62/58/99/625899b20d246d96aee599c09a11d9ce.jpg",
          isFavourite: allPhonesResult.bestModel[i].isFavourite,
          discountPrise: allPhonesResult.bestModel[i].discountPrise,
          price: allPhonesResult.bestModel[i].price,
        ),
      );
    } else {
      File _imageBest = await DefaultCacheManager()
          .getSingleFile(allPhonesResult.bestModel[i].image);
      print('url: ${allPhonesResult.bestModel[i].image}');
      finalPhoneBest.add(
        PhoneBestModel(
          id: allPhonesResult.bestModel[i].id,
          name: allPhonesResult.bestModel[i].name,
          image: _imageBest.path,
          isFavourite: allPhonesResult.bestModel[i].isFavourite,
          discountPrise: allPhonesResult.bestModel[i].discountPrise,
          price: allPhonesResult.bestModel[i].price,
        ),
      );
    }
  }
  return finalPhoneBest;
}
