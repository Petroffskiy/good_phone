
import '../../domain/model/home/all_phones_model.dart';
import '../../domain/repository/home/home_repository.dart';
import '../../domain/repository/product_detail/product_detail_repository.dart';

class RepositoryModule {
  final  HomeRepository _homeRepository;

  RepositoryModule(this._homeRepository, );

  Future<AllPhonesModel> allPhones(){
    return _homeRepository.allPhones();
  }
}