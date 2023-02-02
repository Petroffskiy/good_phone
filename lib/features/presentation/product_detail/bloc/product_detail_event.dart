part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetDetailData extends ProductDetailEvent {
  final int id;

  const GetDetailData({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
