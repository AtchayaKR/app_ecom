import 'package:app_ecom/controller/theme_controller.dart';
import 'package:app_ecom/model/categoryitem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiledView extends StatelessWidget {
  final CategoryItem categoryItem;

  const TiledView({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;
      final containerColor =
          isDarkMode ? const Color.fromARGB(255, 34, 34, 34) : Colors.white;

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(15)),
              child: Image.asset(
                categoryItem.imagePath,
                width: 100,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTruncatedTitle(categoryItem.title, 60),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.grey : Colors.black,
                      ),
                    ),
                    Text(
                      getTruncatedTitle(categoryItem.description, 60),
                      style: TextStyle(
                        fontSize: 13,
                        color: isDarkMode ? Colors.grey[400] : Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${categoryItem.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Obx(() => IconButton(
                              icon: Icon(
                                categoryItem.isLiked.value
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: categoryItem.isLiked.value
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                categoryItem.isLiked.toggle();
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  String getTruncatedTitle(String actualString, int maxLetters) {
    return actualString.length > maxLetters
        ? "${actualString.substring(0, maxLetters)}..."
        : actualString;
  }
}
