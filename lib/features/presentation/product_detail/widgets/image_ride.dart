import 'package:flutter/material.dart';
import 'package:good_phone/features/domain/model/detail_product/product_detail_model.dart';
import 'package:good_phone/features/presentation/product_detail/widgets/properties_shop.dart';
import '../widgets/list_properties.dart';

//TODO: IMAGE RIDE FOR ONLY IMAGE, NOT OTHER WIDGET

class ImageRide extends StatelessWidget {
  final ProductDetailModel detailModel;

  ImageRide({
    Key? key,
    required this.detailModel,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.85),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2)),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Image.network(
                      detailModel.images[index % detailModel.images.length],
                      width: 60,
                      height: 120,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
