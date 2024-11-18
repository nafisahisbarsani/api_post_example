import 'package:api_example/widget/my_card.dart';
import 'package:api_example/widget/my_color.dart';
import 'package:api_example/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MealController.dart';

class Mealview extends StatelessWidget {
  final MealController mealController =
      Get.find(); // Using Get.find() to get the controller instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
            text: "GetX API Example",
            color: textColor,
            fontsize: 15,
            fontWeight: FontWeight.normal),
      ),
      body: Obx(() {
        if (mealController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: mealController.categoryList.length, // Using categoryList
            itemBuilder: (context, index) {
              final category = mealController
                  .categoryList[index]; // Using category instead of post
              return MyCard(
                  title: category.strCategory,
                  description: category.strCategoryDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
              );
            },
          ),
        );
      }),
    );
  }
}
