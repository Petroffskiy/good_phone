import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'model/navigation_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomBottomNavigationBar({Key? key, required this.tabsRouter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Text(
                "Explorer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                backgroundColor: Colors.black,
                items: NavigationModel.BottomNavigation,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
