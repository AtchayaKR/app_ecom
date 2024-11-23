import 'package:get/get.dart';

class CategoryItem {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  RxBool isLiked;

  CategoryItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.isLiked,
  });
}
