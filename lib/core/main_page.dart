import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_phone/core/theme/custom_nested_router/custom_nav_bar.dart';

import 'router/router.gr.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        FavouritePhoneRoute(),
      ],
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBuilder: (_, tabsRouter) {

        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: CustomBottomNavigationBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
