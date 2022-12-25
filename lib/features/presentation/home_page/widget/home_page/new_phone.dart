import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/home/phone_model.dart';

class HotSales extends StatelessWidget {
  final List<PhoneModel> hotSales;

  HotSales({
    Key? key,
    required this.hotSales,
  }) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: PageController(viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemCount: hotSales.length,
          itemBuilder: (BuildContext context, int index) {
            return cardPhones(
                imageUrl: hotSales[index].image,
                isNew: hotSales[index].isNew ?? false,
                name: hotSales[index].namePhone,
                description: hotSales[index].descriptionPhone);
          },
        ),
      ),
    );
  }

  Widget cardPhones({
    required String imageUrl,
    required bool isNew,
    required String name,
    required String description,
  }) {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isNew)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFF6E4E),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 2,
                              ),
                              child: Text(
                                "New",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Container(
                          width: 120,
                          child: Text(
                            name,
                            style: const TextStyle(
                              overflow: TextOverflow.visible,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 26,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            //TODO: request for buy
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 5),
                              child: Text(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                  "Buy now!"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
