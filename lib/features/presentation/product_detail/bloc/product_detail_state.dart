part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailError extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailDownload extends ProductDetailState {
  final ProductDetailModel detailModel;

  const ProductDetailDownload({
    required this.detailModel,
  });

  @override
  List<Object?> get props => [
        detailModel,
      ];
}
