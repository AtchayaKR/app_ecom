import 'package:app_ecom/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalProductGrid extends StatelessWidget {
  const VerticalProductGrid({
    super.key,
    required this.containerImage,
    required this.imageTitle,
    required this.borderRadius,
    required this.imageHeight,
    required this.imageWidth,
  });

  final String containerImage;
  final String imageTitle;
  final double imageHeight;
  final double imageWidth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            // Image Container
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
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
                      child: Image.asset(
                        containerImage,
                        height: imageHeight * 0.75,
                        width: imageWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          imageTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
