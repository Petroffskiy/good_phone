import '../model/home/all_phones_model.dart';
import '../repository/home/home_repository.dart';

class GetHomePhone {
  final HomeRepository repository;

  GetHomePhone(this.repository);

  Future<AllPhonesModel> allPhones() {
    return repository.allPhones();
  }
}