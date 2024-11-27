import 'package:app_ecom/data/categorydata.dart';
import 'package:app_ecom/utils/carousalimages.dart';
import 'package:app_ecom/widget/carousal_slider_widget.dart';
import 'package:app_ecom/widget/categories_list_view.dart';
import 'package:app_ecom/widget/searchbar.dart';
import 'package:app_ecom/widget/tiledview.dart';
import 'package:app_ecom/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScrn extends StatelessWidget {
  const HomeScrn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(Get.context!).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Topbar(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Searchbar(),

                      const SizedBox(
                        height: 10,
                      ),
                      // Slider banner
                      CarouselSliderWidget(
                          sliderList: [
                            CarousalImages.camera,
                            CarousalImages.cosmetics,
                            CarousalImages.waterBottle,
                            CarousalImages.network,
                            CarousalImages.headphone,
                          ].obs,
                          viewFraction: 1.0,
                          height: height * .18),
                      const SizedBox(
                        height: 10,
                      ),
                      //Featured Category
                      const Text(
                        'Featured',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CategoriesListView(
                        listViewHeight: 200,
                        scrollDirection: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //All Category
                      const Text(
                        'All',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //tileview
                      ListView.builder(
                        itemCount: categoryItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TiledView(
                            categoryItem: categoryItems[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
