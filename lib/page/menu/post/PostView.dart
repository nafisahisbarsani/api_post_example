import 'package:api_example/widget/my_card.dart';
import 'package:api_example/widget/my_color.dart';
import 'package:api_example/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PostController.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
            text: 'GetX API Example',
            color: textColor,
            fontsize: 15,
            fontWeight: FontWeight.normal),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return MyCard(title: post.title, description: post.body, maxLines: 2, overflow: TextOverflow.ellipsis);
          },
        );
      }),
    );
  }
}
