import 'package:app_ecom/data/categorydata.dart';
import 'package:app_ecom/utils/searchcategory.dart';
import 'package:app_ecom/widget/widget_images/image_text.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    this.listViewHeight,
    this.scrollDirection = false,
  });
  final double? listViewHeight;
  final bool scrollDirection;

  @override
  Widget build(BuildContext context) {
    final List iconList = [
      SearchCategoryImages.adidas,
      SearchCategoryImages.applelaptop,
      SearchCategoryImages.batashoe,
      SearchCategoryImages.camera,
      SearchCategoryImages.cosmetics,
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: SizedBox(
        height: listViewHeight,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: scrollDirection ? Axis.horizontal : Axis.vertical,
            itemCount: iconList.length,
            itemBuilder: (context, int index) {
              return StoreVerticalImageText(
                containerImage: categoryItems[index].imagePath,
                imageTitle: categoryItems[index].title,
                imageHeight: 200,
                imageWidth: 180,
                borderRadius: 15.0,
                categoryItem: categoryItems[index],
              );
            }),
      ),
    );
  }
}
