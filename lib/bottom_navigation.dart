import 'package:app_ecom/controller/theme_controller.dart';
import 'package:app_ecom/view/qrscanner/bottomnav.dart';
import 'package:app_ecom/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_ecom/view/home/home_scrn.dart';
import 'package:app_ecom/view/profile/profille_scrn.dart';
import 'package:app_ecom/view/searchproduct/searchlist.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final themeController = Get.put(ThemeController());

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

      return Scaffold(
        body: navigationController
            .screens[navigationController.selectedIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: navigationController.hideBottomNavScreens
                .contains(navigationController.selectedIndex.value)
            ? null
            : Container(
                margin: EdgeInsets.only(top: 10),
                height: 64,
                width: 64,
                child: FloatingActionButton(
                  onPressed: () {
                    navigationController.selectedIndex.value = 2;
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                          width: 3,
                          color: isDarkMode ? Colors.black : Colors.white)),
                  elevation: 0,
                  backgroundColor: Colors.yellow,
                  child:
                      Icon(Icons.qr_code_scanner_outlined, color: Colors.black),
                ),
              ),
        bottomNavigationBar: navigationController.hideBottomNavScreens
                .contains(navigationController.selectedIndex.value)
            ? null
            : BottomAppBar(
                color: isDarkMode
                    ? const Color.fromARGB(255, 34, 34, 34)
                    : Colors.grey[300],
                shape: const CircularNotchedRectangle(),
                clipBehavior: Clip.antiAlias,
                notchMargin: 4.0,
                elevation: 10,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            navigationController.selectedIndex.value =
                                0; // Home
                          },
                          icon: Icon(
                            Icons.home,
                            color: navigationController.selectedIndex.value == 0
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            navigationController.selectedIndex.value =
                                1; // Search
                          },
                          icon: Icon(
                            Icons.search_outlined,
                            color: navigationController.selectedIndex.value == 1
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 48),
                        IconButton(
                          onPressed: () {
                            navigationController.selectedIndex.value =
                                3; // Favorites
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: navigationController.selectedIndex.value == 3
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            navigationController.selectedIndex.value =
                                4; // Profile
                          },
                          icon: Icon(
                            Icons.person_4_outlined,
                            color: navigationController.selectedIndex.value == 4
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  //  screens
  final screens = [
    const HomeScrn(),
    SearchCategory(),
    BottomNavScreen(),
    WishlistScrn(),
    const ProfileScreen(),
  ];

  //  screens hide the bottom navigation bar
  final hideBottomNavScreens = {2}; // Index of QR Scanner
}
