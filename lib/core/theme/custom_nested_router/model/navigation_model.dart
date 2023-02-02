import 'package:flutter/material.dart';

class NavigationModel {
  static const icons = [
    Icon(Icons.shopping_bag_outlined, size: 20,),
    Icon(Icons.favorite_outline, size: 20,),
    Icon(Icons.person_outlined, size: 20,),
  ];
  static const labels = ["shop", 'favourite', 'profile'];

  static final List<BottomNavigationBarItem> BottomNavigation = [
    BottomNavigationBarItem(icon: icons[0], label: labels[0]),
    BottomNavigationBarItem(icon: icons[1], label: labels[1]),
    // BottomNavigationBarItem(icon: icons[2], label: labels[2]),
  ];
}
