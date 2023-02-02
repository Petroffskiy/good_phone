import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/features/presentation/product_detail/widgets/image_ride.dart';

import '../bloc/product_detail_bloc.dart';
import '../widgets/list_properties.dart';
import '../widgets/properties_shop.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(
          key: key,
        );

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context)
        .add(GetDetailData(id: widget.id));
    super.initState();
  }

//TODO: need go to domain
  List<String> properties = [
    "Shop",
    "Detail",
    "Features",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff010035)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Product Details",
                    style: TextStyle(fontSize: 18, color: Color(0xff010035)),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFF6E4E)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                  builder: (context, state) {
                if (state is ProductDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductDetailDownload) {
                  return Column(
                    children: [
                      ImageRide(detailModel: state.detailModel),
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 28.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.detailModel.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        // TODO: need add to favourite
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff010035)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            state.detailModel.isFavourite
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text("Here will be rating"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 32),
                                  child: Column(
                                    children: [
                                      ListProperties(
                                          propertiesList: properties),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 33.0),
                                        child: PropertiesShop(
                                          detailModel: state.detailModel,
                                          context: context,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            //TODO: buy this phone with characteristic
                                          },
                                          child: Container(
                                            height: 54,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0xffFF6E4E),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40.0,
                                                      vertical: 14.0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    " \$${state.detailModel.price}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Sorry, my bad..."),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
