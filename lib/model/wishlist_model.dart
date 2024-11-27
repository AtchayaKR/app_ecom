import 'package:get/get.dart';

class WishlistItem {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  RxBool isLiked;

  WishlistItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
  });
}
