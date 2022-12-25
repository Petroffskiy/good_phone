import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:good_phone/features/domain/model/home/all_phones_model.dart';

import '../../../domain/model/home/phone_best_model.dart';
import '../../../domain/model/home/phone_model.dart';
import '../../../domain/usecase/get_home_phone.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final  GetHomePhone _allPhones;

  HomeBloc(this._allPhones) : super(HomeEmpty()) {
    on<GetHomePhones>(
      (event, emit) async {
        emit(HomeLoading());
        final allPhonesResult = await _allPhones.allPhones();

        if (allPhonesResult != null) {
          emit(
            HomeDownload(
              allPhonesResult,
              allPhonesResult.allPhone,
              allPhonesResult.bestModel,
            ),
          );
        } else {
          emit(HomeError());
        }
      },
    );
  }
}
