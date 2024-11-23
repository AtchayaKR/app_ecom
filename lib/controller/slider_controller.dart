import 'package:get/get.dart';

class Carouselslidercontroller extends GetxController {
  static Carouselslidercontroller get instance => Get.find();

  final sliderIndex = 0.obs;

  void sliderUpdateIndicator(index) {
    sliderIndex.value = index;
  }
}
