import 'package:get/get.dart';
import 'MealApiService.dart';
import 'MealModel.dart';

class MealController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <Category>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Metode untuk mengambil daftar kategori
  void fetchCategories() async {
    try {
      isLoading(true);
      var categories = await ApiServiceMeal().fetchCategories();
      categoryList.assignAll(categories);
    } finally {
      isLoading(false);
    }
  }
}
