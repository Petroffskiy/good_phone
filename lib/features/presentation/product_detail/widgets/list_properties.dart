import 'package:flutter/material.dart';

class ListProperties extends StatefulWidget {
  final List<String> propertiesList;
  //TODO: need create VoidCallback for open true widget
  // final VoidCallback _callback;

  const ListProperties({
    Key? key,
    required this.propertiesList,
  }) : super(key: key);

  @override
  State<ListProperties> createState() => _ListPropertiesState();
}

class _ListPropertiesState extends State<ListProperties> {
  int indexActive = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: listProperties(properties: widget.propertiesList),
    );
  }

  List<Widget> listProperties({required List<String> properties}) {
    List<Widget> result = [];
    for (int i = 0; i < properties.length; i++) {
      if (i == indexActive) {
        result.add(
          GestureDetector(
            onTap: () {
              indexActive = i;
              setState(() {});
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffFF6E4E),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  properties[i],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      } else {
        result.add(
          GestureDetector(
            onTap: () {
              indexActive = i;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                properties[i],
                style: const TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      }
    }
    return result;
  }
}
