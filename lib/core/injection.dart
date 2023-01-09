import 'package:good_phone/features/data/api/ApiUtil.dart';
import 'package:good_phone/features/domain/repository/home/home_repository.dart';
import 'package:good_phone/features/presentation/home/bloc/home_bloc.dart';

import '../features/data/api/service/list_phone_service.dart';
import '../features/data/repository/main_phones_data_repository.dart';
import '../features/domain/usecase/get_home_phone.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => HomeBloc(locator()));

  locator.registerLazySingleton(() => GetHomePhone(locator()));

  locator.registerLazySingleton<HomeRepository>(
      () => MainPhoneDataRepository(locator()));

  locator.registerLazySingleton<ListPhoneService>(() => ListPhoneService());
  locator.registerLazySingleton<ApiUtil>(() => ApiUtil(locator()));
}
