import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_ctr.dart';
import 'menu/meal/MealController.dart';
import 'menu/meal/MealView.dart';
import 'menu/post/PostController.dart';
import 'menu/post/PostView.dart';

class HomePage extends StatelessWidget {
  final BottomNavCtr bottomNavCtr;
  final PostController postController;
  final MealController mealController;

  const HomePage({
    required this.bottomNavCtr,
    required this.postController,
    required this.mealController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavCtr bottomNavCtr = Get.find();
    final List<Widget> menus = [
      PostView(),
      Mealview(),
    ];

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: bottomNavCtr.selectedIndex.value,
          children: menus,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "PostView"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Meal"),
          ],
        ),
      );
    });
  }
}
