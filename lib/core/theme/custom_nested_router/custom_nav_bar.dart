import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../router/router.gr.dart';
import 'model/navigation_model.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   final TabsRouter tabsRouter;
//
//   const CustomBottomNavigationBar({Key? key, required this.tabsRouter})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: BottomNavigationBar(
//           showUnselectedLabels: false,
//           showSelectedLabels: false,
//           backgroundColor: const Color(0xff010035),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white38,
//           currentIndex: tabsRouter.activeIndex,
//           onTap: tabsRouter.setActiveIndex,
//           items: [...NavigationModel.BottomNavigation],
//         ),
//       ),
//     );
//   }
// }

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // appBarBuilder: (_, tabsRouter) => AppBar(
      //   leading: const AutoLeadingButton(),
      // ),
      routes: const [
        MainRoute(),
        FavouritePhoneRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              // width: MediaQuery.of(context).size.width,

              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor:  const Color(0xff010035),
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.white,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                  },
                  items: [
                    ...NavigationModel.BottomNavigation
                  ],
                ),
              ),
            ),
          ),
        );
        // return SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   height: 50,
        //   child: Row(
        //     children: [
        //       const Text("Explorer"),
        //       BottomNavigationBar(
        //           currentIndex: tabsRouter.activeIndex,
        //           onTap: tabsRouter.setActiveIndex,
        //           items: [
        //             BottomNavigationBarItem(
        //                 icon: NavigationModel.icons[0], label: 'shop'),
        //             BottomNavigationBarItem(
        //                 icon: NavigationModel.icons[1], label: 'favourite'),
        //             // BottomNavigationBarItem(
        //             //     icon: NavigationModel.icons[2], label: 'profile'),
        //             // for( final i in NavigationModel.iocons)
        //             //   BottomNavigationBarItem(icon: i, )
        //             // for (final i in NavigationModel.iocons){
        //             //   BottomNavigationBarItem(icon: i)
        //             // }
        //           ]),
        //       // BottomNavigationBar(
        //       //   destinations: const [
        //       //     NavigationDestination(
        //       //         icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
        //       //     NavigationDestination(
        //       //         icon: Icon(Icons.favorite_outline), label: "Favorite"),
        //       //     NavigationDestination(
        //       //         icon: Icon(Icons.person_outlined), label: "Person"),
        //       //   ],
        //       //   onDestinationSelected: (index) =>,
        //       // ),
        //     ],
        //   ),
        // );
        // return SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: BottomNavigationBar(
        //     currentIndex: tabsRouter.activeIndex,
        //     onTap: tabsRouter.setActiveIndex,
        //     items: [
        //       BottomNavigationBarItem(
        //           icon: NavigationModel.icons[0], label: 'shop'),
        //       BottomNavigationBarItem(
        //           icon: NavigationModel.icons[1], label: 'favourite'),
        //     ],
        //   ),
        // );
      },
    );
  }
}
