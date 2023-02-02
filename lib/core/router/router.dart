import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../../features/presentation/favourite/page/favourite_page.dart';
import '../../features/presentation/home/page/home_page.dart';
import '../../features/presentation/product_detail/page/product_detail.dart';
import '../main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page:  EmptyRouterPage,
      name: 'ParentRoute',
      children: [
        AutoRoute(
          initial: true,
          path: 'start/',
          page: StartPage,
          children: [
            AutoRoute(
              path: 'home/',
              name: 'HomeRoute',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: '',
                  name: "MainRoute",
                  page: MainPage,
                ),
              ],
            ),
            //TODO: for favourite page
            AutoRoute(
              path: "favourite/",
              page: FavouritePhonePage,
            ),
            // AutoRoute(
            //   path: 'profile/',
            //   page: ProfilePage,
            // )
          ],
        ),
        AutoRoute(
          path: ':id',
          page: DetailPage,
          name: 'DetailRoute',
          // fullscreenDialog: true,
        ),
      ]
    )

  ],
)
class $AppRouter {}
