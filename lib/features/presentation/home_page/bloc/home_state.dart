part of 'home_bloc.dart';

//TODO: переделать под обстрактный класс
// abstract class HomeState extends Equatable {
//   const HomeState();
// }
//
// class HomeState extends Equatable {
//
//   final AllPhonesModel? phones;
//
//   const HomeState({
//     this.phones,
//     this.status = HomeStatus.loading,
//   });
//
//   HomeState copyWith({
//     HomeStatus? status,
//     AllPhonesModel? phones,
//   }) {
//     return HomeState(
//       status: status ?? this.status,
//       phones: phones ?? this.phones,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         status,
//         phones,
//       ];
// }

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeEmpty extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeDownload extends HomeState {
  final AllPhonesModel allPhones;
  final List<PhoneModel> phoneMain;
  final List<PhoneBestModel> bestSeller;

  const HomeDownload(
    this.allPhones,
    this.phoneMain,
    this.bestSeller,
  );

  @override
  List<Object?> get props => [
        allPhones,
        bestSeller,
        phoneMain,
      ];
}
