import 'package:api_example/page/home_page.dart';
import 'package:api_example/page/login/login_page.dart';
import 'package:api_example/page/menu/meal/MealController.dart';
import 'package:api_example/page/menu/post/PostController.dart';
import 'package:api_example/page/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'binding/app_binding.dart';
import 'controller/bottom_nav_ctr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login', // Set the initial route to login
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(), // Your login page
          binding: AppBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(), // Your register page
          binding: AppBinding(),
        ),
        GetPage(
          name: '/',
          page: () => HomePage(
            bottomNavCtr: Get.find<BottomNavCtr>(),
            postController: Get.find<PostController>(),
            mealController: Get.find<MealController>(),
          ),
          binding: AppBinding(),
        ),
      ],
    );
  }
}
