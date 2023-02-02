import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/features/domain/repository/home/filter_option_repository.dart';

import '../../bloc/home_bloc.dart';

showCustomBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 44.0, top: 24, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff010035),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          Icons.cancel_presentation_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Filter options",
                    style: TextStyle(fontSize: 18, color: Color(0xff010035)),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: complete filtered
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFF6E4E),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 19.0, vertical: 7),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeDownload) {
                    return CustomFilter(
                      price: state.price,
                      context: context,
                      phones: state.phones,
                      titles: state.titles,
                    );
                  } else {
                    return const Center(
                      child: Text("Sorry, please wait"),
                    );
                  }
                }),
              ),
            ],
          ),
        );
      });
}

class CustomFilter extends StatefulWidget {
  final List<int> price;
  final List<String> titles;
  final List<String> phones;
  final BuildContext context;

  const CustomFilter({
    super.key,
    required this.price,
    required this.phones,
    required this.titles,
    required this.context,
  });

  @override
  State<StatefulWidget> createState() => _CustomFilter();
}

class _CustomFilter extends State<CustomFilter> {
  String? drop1;
  int? drop2;
  int? drop3;

  @override
  void initState() {
    drop1 = null;
    drop2 = null;
    drop3 = null;
    super.initState();
  }

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titles[0],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DropdownButton<String>(
                  hint: Text(widget.phones.first),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  underline: Container(),
                  value: drop1,
                  onChanged: (String? value) {
                    setState(() {
                      drop1 = value!;
                    });
                  },
                  items: widget.phones
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        Padding(
          padding: const  EdgeInsets.only(top: 15),
          child: Text(
            widget.titles[1],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DropdownButton<int>(
                  hint: Text("\$${widget.price.first} - \$${widget.price.last}"),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  underline: Container(),
                  value: drop2,
                  onChanged: (int? value) {
                    setState(() {
                      drop2 = value!;
                    });
                  },
                  items: widget.price.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        "\$${value.toString()}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        Padding(
          padding: const  EdgeInsets.only(top: 15),
          child: Text(
            widget.titles[2],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DropdownButton<int>(
                  hint: Text("4.5 to 5.5 inches"),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  underline: Container(),
                  // value: drop2,
                  onChanged: (int? value) {
                    setState(() {
                      // drop2 = value!;
                    });
                  },
                  //TODO: for nex filter
                  items: widget.price.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        "\$${value.toString()}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
      ],
    );
  }
}
