import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/home/phone_best_model.dart';

class BestSellerSingle extends StatefulWidget {
  final String image;
  final int price;
  final int priceDiscount;
  final String name;

  const BestSellerSingle({
    Key? key,
    required this.image,
    required this.price,
    required this.priceDiscount,
    required this.name,
  }) : super(key: key);

  @override
  State<BestSellerSingle> createState() => _BestSellerSingleState();
}

class _BestSellerSingleState extends State<BestSellerSingle> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 14,
        bottom: 12,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 168,
                  height: 187,
                  child: Image.network(widget.image),
                ),
                Row(
                  children: [
                    // Text(
                    //   "\$${widget.price}",
                    //   style: const TextStyle(
                    //       fontWeight: FontWeight.bold, fontSize: 16),
                    // ),
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
          Padding(
            padding: const EdgeInsets.only(top: 11.0, right: 12.0),
            child: GestureDetector(
              onTap: () {
                //TODO: need adding in favorite page
                isFavorite = !isFavorite;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isFavorite
                      ? const Icon(Icons.heart_broken)
                      : const Icon(Icons.heart_broken_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> listPhones({required List<PhoneBestModel> phones}) {
  final List<Widget> result = [];
  for (int i = 0; i < phones.length; i++) {
    if (i.isOdd) {
      continue;
    }
    result.add(
      Row(
        children: [
          BestSellerSingle(
            image: phones[i].image,
            price: phones[i].price,
            priceDiscount: phones[i].discountPrise,
            name: phones[i].name,
          ),
          if ((i + 1) != phones.length)
            BestSellerSingle(
              image: phones[i + 1].image,
              price: phones[i + 1].price,
              priceDiscount: phones[i + 1].discountPrise,
              name: phones[i + 1].name,
            ),
        ],
      ),
    );
  }
  return result;
}
