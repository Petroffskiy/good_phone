import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  int indexActive = 0;
  List<Map<String, dynamic>> category = [
    {
      'name': "Phones",
      "icon": Icons.phone_iphone_rounded,
    },
    {
      'name': "Computer",
      'icon': Icons.computer_outlined,
    },
    {
      'name': "Health",
      'icon': Icons.healing,
    },
    {
      'name': "Books",
      'icon': Icons.book_sharp,
    },
    {
      'name': "Watches",
      'icon': Icons.watch,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: category[index] == category.last
              ? const EdgeInsets.only(
                  right: 23,
                  left: 23,
                )
              : const EdgeInsets.only(
                  left: 23,
                  // right: 23,
                ),
          child: GestureDetector(
            onTap: () {
              indexActive = index;
              setState(() {});
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: indexActive == index
                        ? const Color(0xffFF6E4E)
                        : const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      category[index]['icon'],
                      size: 24,
                      color: indexActive == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(category[index]['name']),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
