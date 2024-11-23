import 'package:app_ecom/controller/theme_controller.dart';
import 'package:app_ecom/model/categoryitem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreVerticalImageText extends StatelessWidget {
  const StoreVerticalImageText(
      {super.key,
       required this.categoryItem,
      required this.containerImage,
      required this.imageTitle,
      required this.borderRadius,
      required this.imageHeight,
      required this.imageWidth});

  final String containerImage;
  final String imageTitle;
  final double imageHeight;
  final double imageWidth;
  final double borderRadius;
  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Obx(() {
              final isDarkMode =
                  themeController.themeMode.value == ThemeMode.dark;
              final containerColor = isDarkMode
                  ? const Color.fromARGB(255, 34, 34, 34)
                  : Colors.white;
              return Container(
                height: imageHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
                      child: Image.asset(
                        categoryItem.imagePath,
                        height: imageHeight * 0.7,
                        width: imageWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 6, 14, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryItem.title,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${categoryItem.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const Icon(Icons.favorite_border_rounded),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
