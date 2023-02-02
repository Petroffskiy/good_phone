import 'package:flutter/material.dart';

import '../../../domain/model/detail_product/product_detail_model.dart';

import 'dart:developer' as developer;

class PropertiesShop extends StatefulWidget {
  final ProductDetailModel detailModel;
  final BuildContext context;

  const PropertiesShop({
    Key? key,
    required this.detailModel,
    required this.context,
  }) : super(key: key);

  @override
  State<PropertiesShop> createState() => _PropertiesShopState();
}

class _PropertiesShopState extends State<PropertiesShop> {
  int indexMemory = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.remove_from_queue,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  widget.detailModel.cpu,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Text(
                    widget.detailModel.cameraOption,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Icon(
                  Icons.memory,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  widget.detailModel.ram,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.sd_card_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Text(
                    widget.detailModel.memory,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              "Select color and capacity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Row(
            children: [
              ...colorsList(colors: widget.detailModel.colors),
              const Spacer(),
              ...memorySize(
              memory: widget.detailModel.capacity,
              context: widget.context,
            ),]
          ),
        ),
      ],
    );
  }

  List<Widget> colorsList({required List<String> colors}) {
    List<Widget> result = [];
    for(int i=0; i<colors.length; i++){
      result.add(Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Container(child: Text("Color"),),
      ));
    }
    return result;
  }

  List<Widget> memorySize({
    required List<String> memory,
    required BuildContext context,
  }) {
    List<Widget> result = [];
    for (int index = 0; index < memory.length; index++) {
      result.add(
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
          ),
          child: GestureDetector(
            onTap: () {
              indexMemory = index;
              developer.log('tap $index ', name: "tap in properties");
              developer.log('this is memory $indexMemory ', name: "tap in properties");
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: index == indexMemory ? Colors.red : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                child: Text(
                  memory[index],
                  style: TextStyle(
                      color:
                          index == indexMemory ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
      );
    }
    // List.generate(
    //   memory.length,
    //   (index) => result.add(
    //     Padding(
    //       padding: const EdgeInsets.only(
    //         left: 30.0,
    //       ),
    //       child: GestureDetector(
    //         onTap: () {
    //           indexMemory = index;
    //           developer.log('tap $index ', name: "tap in properties");
    //           // setState(() {});
    //         },
    //         child: Container(
    //           decoration: BoxDecoration(
    //               color: indexMemory == index ? Colors.red : Colors.transparent,
    //               borderRadius: BorderRadius.circular(10)),
    //           child: Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
    //             child: Text(
    //               memory[index],
    //               style: TextStyle(
    //                   color:
    //                       indexMemory == index ? Colors.white : Colors.black),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return result;
  }
}
