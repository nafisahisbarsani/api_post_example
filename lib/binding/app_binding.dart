import 'package:api_example/controller/login_controller.dart';
import 'package:api_example/controller/register_controller.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_ctr.dart';
import '../page/menu/meal/MealController.dart';
import '../page/menu/post/PostController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavCtr>(() => BottomNavCtr());
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<MealController>(() => MealController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
