import 'package:app_ecom/controller/slider_controller.dart';
import 'package:app_ecom/widget/widget_container/circular_container.dart';
import 'package:app_ecom/widget/widget_container/slider_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required this.sliderList,
    required this.viewFraction,
    required this.height,
  });
  final RxList<String> sliderList;
  final double viewFraction, height;

  @override
  Widget build(BuildContext context) {
    final carouselSliderController = Get.put(Carouselslidercontroller());
    return Column(
      children: [
        CarouselSlider(
            items: sliderList
                .map((url) => StoreBannerImages(
                    fit: BoxFit.cover,
                    applyImageRadius: true,
                    borderRadius: 20,
                    imageUrl: url))
                .toList(),
            options: CarouselOptions(
                autoPlay: true,
                height: height,
                onPageChanged: (index, _) =>
                    carouselSliderController.sliderUpdateIndicator(index),
                viewportFraction: viewFraction)),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < sliderList.length; i++)
                CircularContainer(
                  color: carouselSliderController.sliderIndex.value == i
                      ? Colors.yellow
                      : Colors.grey,
                  borderRadius: 20,
                  height: 4,
                  radius: 10,
                  margin: const EdgeInsets.only(right: 10),
                  showColor: true,
                )
            ],
          ),
        )
      ],
    );
  }
}
