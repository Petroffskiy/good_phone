part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeEmpty extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeDownload extends HomeState {
  final List<int> price;
  final List<String> titles;
  final List<String> phones;
  final AllPhonesModel allPhones;
  final List<PhoneModel> phoneMain;
  final List<PhoneBestModel> bestSeller;

  const HomeDownload({
    required this.price,
    required this.titles,
    required this.phones,
    required this.allPhones,
    required this.phoneMain,
    required this.bestSeller,
  });

  @override
  List<Object?> get props => [
        price,
        titles,
        phones,
        allPhones,
        bestSeller,
        phoneMain,
      ];
}
