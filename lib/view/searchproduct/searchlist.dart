import 'package:app_ecom/controller/theme_controller.dart';
import 'package:app_ecom/data/categorydata.dart';
import 'package:app_ecom/widget/widget_layout/grid_layout.dart';
import 'package:app_ecom/widget/widget_layout/vertical_product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCategory extends StatelessWidget {
  const SearchCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar and Favorite Button
              Obx(() {
                final isDarkMode =
                    themeController.themeMode.value == ThemeMode.dark;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          filled: true,
                          fillColor: isDarkMode
                              ? const Color.fromARGB(255, 34, 34, 34)
                              : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CircleAvatar(
                      backgroundColor: isDarkMode
                          ? const Color.fromARGB(255, 34, 34, 34)
                          : Colors.white,
                      radius: 25,
                      child: const Icon(Icons.favorite_border_rounded),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 10),

              // Categories
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Category List
              Expanded(
                child: GridLayout(
                  itemCount: categoryItems.length,
                  itemBuilder: (_, index) => VerticalProductGrid(
                    containerImage: categoryItems[index].imagePath,
                    imageTitle: categoryItems[index].title,
                    imageHeight: 200,
                    imageWidth: double.infinity,
                    borderRadius: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
