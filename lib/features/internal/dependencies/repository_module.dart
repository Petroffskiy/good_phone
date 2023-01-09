import 'package:good_phone/features/internal/dependencies/api_module.dart';

import '../../domain/model/home/all_phones_model.dart';
import '../../domain/repository/home/home_repository.dart';

class RepositoryModule {
  final  HomeRepository _homeRepository;

  RepositoryModule(this._homeRepository);

  Future<AllPhonesModel> allPhones(){
    return _homeRepository.allPhones();
  }
}