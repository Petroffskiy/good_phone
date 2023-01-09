import 'package:auto_route/auto_route.dart';

import '../../features/presentation/favourite/page/favourite_page.dart';
import '../../features/presentation/home/page/home_page.dart';
import '../../features/presentation/product_detail/page/product_detail.dart';
import '../theme/custom_nested_router/custom_nav_bar.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: CustomBottomNavigationBar,
      children: [
        AutoRoute(
          path: 'home/',
          name: "MainRoute",
          page: MainPage,
          initial: true,
          children: [
            // AutoRoute(
            //   path: " ",
            //   page: MainPage,
            //   initial: true,
            // ),
            AutoRoute(
              path: ':id',
              page: DetailPage,
            )
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
    )
  ],
)
class $AppRouter {}

// final AutoRoute router = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: "/home",
//     routes: [
//       ShellRoute(
//         navigatorKey: _rootNavigatorKey,
//         builder: (context, state, child) {
//           return CustomBottomNavigationBar(child: child);
//         },
//         routes: [
//           GoRoute(path: '/home',
//           routes: [
//
//           ]),
//           // GoRoute(
//           //   path: '/home',
//           //   builder: (context, state) {
//           //     return const MainPage();
//           //   },
//           // ),
//           GoRoute(
//               path: "/detail",
//               builder: (context, state) {
//                 return const Detail();
//               })
//         ],
//       ),
//     ]);
