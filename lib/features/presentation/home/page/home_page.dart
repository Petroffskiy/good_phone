import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/features/presentation/home/widget/home_page/best_seller_list.dart';

import '../bloc/home_bloc.dart';
import '../widget/home_page/list_category.dart';
import '../widget/home_page/modal_bottom_sheet.dart';
import '../widget/home_page/new_phone.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(const GetHomePhones());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 70.0),
                            child: Icon(
                              Icons.fmd_good_outlined,
                              color: Color(0xffFF6E4E),
                            ),
                          ),
                          const Text("Zihuatanejo, Gro"),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 35,
                      child: IconButton(
                        onPressed: () {
                          showCustomBottomSheet(context: context);
                        },
                        icon: const Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                left: 17.0,
                right: 33.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Category",
                    style: TextStyle(fontSize: 25),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'view all',
                      style: TextStyle(
                        color: Color(0xffFF6E4E),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 110,
              child: Padding(
                padding: EdgeInsets.only(top: 23),
                child: ListCategory(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 35,
                left: 32,
                // right: 37,
              ),
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 0, left: 12, top: 0),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.find_replace_rounded,
                            color: Color(0xffFF6E4E),
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffFF6E4E),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 17,
                right: 27,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Hot sales",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "see more",
                          style: TextStyle(
                            color: Color(0xffFF6E4E),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is HomeDownload) {
                        return Column(
                          children: [
                            HotSales(
                              hotSales: state.phoneMain,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "Best seller",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "see more",
                                      style: TextStyle(
                                        color: Color(0xffFF6E4E),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ...listPhones(
                                    phones: state.bestSeller, context: context)
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("Sorry, my bad..."),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
