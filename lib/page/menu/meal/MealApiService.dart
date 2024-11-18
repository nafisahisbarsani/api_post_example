import 'dart:convert';
import 'package:http/http.dart' as http;
import 'MealModel.dart';

class ApiServiceMeal {
  final String baseUrl =
      'https://www.themealdb.com/api/json/v1/1/'; // Ganti dengan URL API Anda

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Category> categories = (data['categories'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
