import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:good_phone/features/domain/model/detail_product/product_detail_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_product_detail_usecase.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUsecase _detailUsecase;

  ProductDetailBloc(this._detailUsecase) : super(ProductDetailInitial()) {
    on<GetDetailData>((event, emit) async {
      emit(ProductDetailLoading());

      final ProductDetailModel detailResult =
          await _detailUsecase.getProductDetail(id: event.id);
      print(detailResult.name);

      emit(
        ProductDetailDownload(
          detailModel: detailResult,
        ),
      );
    });
  }
}
