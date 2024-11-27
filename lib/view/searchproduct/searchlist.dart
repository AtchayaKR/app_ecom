import 'package:app_ecom/controller/theme_controller.dart';
import 'package:app_ecom/data/categorydata.dart';
import 'package:app_ecom/model/categoryitem_model.dart';
import 'package:app_ecom/widget/widget_layout/grid_layout.dart';
import 'package:app_ecom/widget/widget_layout/vertical_product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCategory extends StatelessWidget {
  SearchCategory({super.key});

  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final RxList<CategoryItem> filteredItems = categoryItems.obs;

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
                        controller: searchController,
                        onChanged: (value) {
                          searchQuery.value = value;
                          filterItems(); // Update the filtered list
                        },
                        style: const TextStyle(fontSize: 14),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear,size:16),
                            onPressed: () {
                              searchController.clear();
                              searchQuery.value = '';
                              filteredItems.value = categoryItems;
                            },
                          ),
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

              // Dynamic Filtered List
              Expanded(
                child: Obx(() {
                  if (filteredItems.isEmpty) {
                    return const Center(
                      child: Text(
                        "No items match your search.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }
                  return GridLayout(
                    itemCount: filteredItems.length,
                    itemBuilder: (_, index) => VerticalProductGrid(
                      containerImage: filteredItems[index].imagePath,
                      imageTitle: filteredItems[index].title,
                      imageHeight: 200,
                      imageWidth: double.infinity,
                      borderRadius: 15,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Filter items based on the search query
  void filterItems() {
    if (searchQuery.value.isEmpty) {
      filteredItems.value = categoryItems;
    } else {
      filteredItems.value = categoryItems
          .where((item) => item.title
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }
}
