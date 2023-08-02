
import 'package:flutter/material.dart';

import '../utility/colorManager.dart';

BottomNavigationBar appBottomNavBar({required int currentIndex,required onItemTapped}){
  return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon:Icon(Icons.list_alt),
            label: "New"
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.access_time_rounded),
            label: "Progress"
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.check_circle_outline_outlined),
            label: "Completed"
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.cancel_outlined),
            label: "Cancelled"
        )
      ],
    selectedItemColor: ColorManager.colorGreen,
    unselectedItemColor: ColorManager.colorLightGray,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemTapped,
    type: BottomNavigationBarType.fixed,
  );
}