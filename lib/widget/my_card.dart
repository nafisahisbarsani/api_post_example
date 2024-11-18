import 'package:flutter/material.dart';
import 'my_text.dart';
import 'my_color.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final int? maxLines; // Parameter opsional maxLines
  final TextOverflow? overflow; // Parameter opsional overflow

  const MyCard({
    super.key,
    required this.title,
    required this.description,
    this.maxLines, // Bisa diatur jika diperlukan
    this.overflow, // Bisa diatur jika diperlukan
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    color: textColor,
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                   SizedBox(height: 6),
                  MyText(
                    text: description,
                    color: textColor,
                    fontsize: 14,
                    fontWeight: FontWeight.normal,
                    maxLines: maxLines,
                    overflow: overflow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
