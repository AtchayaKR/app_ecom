import 'package:app_ecom/model/wishlist_model.dart';
import 'package:app_ecom/utils/searchcategory.dart';
import 'package:get/get.dart';

final RxList<WishlistItem> wishlistItems = RxList([
  WishlistItem(
    imagePath: SearchCategoryImages.adidas,
    title: "Adidas Sneakers",
    description: "High-quality running shoes from Adidas.",
    price: 129.99,
    isLiked: true.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.applelaptop,
    title: "Apple MacBook",
    description: "Sleek and powerful laptop for professionals.",
    price: 1999.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.batashoe,
    title: "Bata Shoes",
    description: "Comfortable and stylish formal shoes.",
    price: 49.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.camera,
    title: "DSLR Camera",
    description: "Capture stunning images with this DSLR.",
    price: 599.99,
    isLiked: true.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.cosmetics,
    title: "Cosmetics Kit",
    description: "All-in-one kit for your beauty needs.",
    price: 24.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.cottonpant,
    title: "Cotton Pants",
    description: "Stylish and comfortable cotton pants.",
    price: 39.99,
    isLiked: true.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.googlephone,
    title: "Google Pixel",
    description: "Experience the best of Android with Pixel.",
    price: 699.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.iphone,
    title: "iPhone 14",
    description: "Apple's latest innovation in smartphones.",
    price: 999.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.jacket,
    title: "Winter Jacket",
    description: "Stay warm and stylish this winter.",
    price: 79.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.menjeans,
    title: "Men's Jeans",
    description: "Durable and trendy denim for men.",
    price: 59.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.pumashoe,
    title: "Puma Sports Shoes",
    description: "Perfect for running and sports activities.",
    price: 89.99,
    isLiked: false.obs,
  ),
  WishlistItem(
    imagePath: SearchCategoryImages.shoe,
    title: "Casual Shoes",
    description: "Everyday casual shoes for comfort.",
    price: 29.99,
    isLiked: false.obs,
  ),
]);
