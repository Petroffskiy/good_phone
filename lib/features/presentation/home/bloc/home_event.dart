part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetHomePhones extends HomeEvent {

  const GetHomePhones();

  @override
  List<Object?> get props => [];
}