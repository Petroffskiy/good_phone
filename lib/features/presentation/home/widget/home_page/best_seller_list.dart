import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_phone/core/router/router.gr.dart';
import 'dart:io';
import '../../../../domain/model/home/phone_best_model.dart';

class BestSellerSingle extends StatefulWidget {
  final int id;
  final String image;
  final int price;
  final int priceDiscount;
  final String name;
  final bool er;
  bool isFavourite;

  BestSellerSingle({
    Key? key,
    required this.id,
    required this.image,
    required this.price,
    required this.priceDiscount,
    required this.name,
    required this.isFavourite,
    this.er = false,
  }) : super(key: key);

  @override
  State<BestSellerSingle> createState() => _BestSellerSingleState();
}

class _BestSellerSingleState extends State<BestSellerSingle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          GestureDetector(
            onTap: () {
              //TODO: необходимо сделать норм навигацию
              // context.router.push(DetailRoute(id: widget.id));
              // context.router.push(MainRoute());
              context.router.push(MainRoute(children: [DetailRoute(id: widget.id)]));
              // AutoRouter.of(context).push(CustomBottomNavigationBar(children: [MainRoute(children: [DetailRoute(id: widget.id)])]));
              print(context.router.stack);
              print(context.router.currentChild?.path);
              print(context.topRoute.name);
              print(context.router.stack.last);
              print("_________________________________");
              print(AutoRouter.of(context).stack);
              print(AutoRouter.of(context).currentChild!.name);
              print(AutoRouter.of(context).childControllers);
              print(AutoRouter.of(context).topRoute.name);
              print(AutoRouter.of(context).isRoot);
              print(AutoRouter.of(context).root.innerRouterOf(CustomBottomNavigationBar.name));
              print(AutoRouter.of(context).root);
              print(AutoRouter.of(context).parentAsStackRouter);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: костыль для решения проблемы с фотографией
                  widget.er != true
                      ? Image.file(
                          File(widget.image),
                          width: 167,
                          height: 187,
                        )
                      : Image.network(
                          widget.image,
                          width: 167,
                          height: 187,
                        ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${widget.price}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: "\$${widget.priceDiscount}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, bottom: 15, left: 21),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11.0, right: 12.0),
            child: GestureDetector(
              onTap: () {
                //TODO: need adding in favorite page
                widget.isFavourite = !widget.isFavourite;
                setState(() {
                  print("Youre tap");
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outline),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> listPhones(
    {required List<PhoneBestModel> phones, required BuildContext context}) {
  final List<Widget> result = [];
  for (int i = 0; i < phones.length; i++) {
    if (i.isOdd) {
      continue;
    }
    result.add(
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 14,
              ),
              child: BestSellerSingle(
                id: phones[i].id,
                image: phones[i].image,
                price: phones[i].price,
                priceDiscount: phones[i].discountPrise,
                name: phones[i].name,
                //TODO: костыль для решения проблемы с фотографией (502)
                er: i == 2 ? true : false,
                isFavourite: phones[i].isFavourite,
              ),
            ),
            if ((i + 1) != phones.length)
              BestSellerSingle(
                id: phones[i + 1].id,
                image: phones[i + 1].image,
                price: phones[i + 1].price,
                priceDiscount: phones[i + 1].discountPrise,
                name: phones[i + 1].name,
                isFavourite: phones[i + 1].isFavourite,
                //TODO: костыль для решения проблемы с фотографией (404)
                er: i +1  == 1 ? true: false,
              ),
          ],
        ),
      ),
    );
  }
  return result;
}
