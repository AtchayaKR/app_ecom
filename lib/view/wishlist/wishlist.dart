import 'package:app_ecom/data/wishlistdata.dart';
import 'package:app_ecom/widget/widget_tiledview/wishlisttile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScrn extends StatelessWidget {
  const WishlistScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => wishlistItems.isEmpty
              ? Center(
                  child: Text(
                    "Your Wishlist is Empty",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = wishlistItems[index];
                    return WishlistTile(
                      imagePath: item.imagePath,
                      title: item.title,
                      price: item.price,
                      onRemove: () {
                        wishlistItems.removeAt(index); 
                        Get.snackbar(
                          "Removed",
                          "${item.title} has been removed from the wishlist.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
