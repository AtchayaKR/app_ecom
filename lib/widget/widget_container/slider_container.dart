import 'package:flutter/material.dart';

class StoreBannerImages extends StatelessWidget {
  const StoreBannerImages({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.isNetWorkImage = false,
    this.onPressed,
    this.padding,
    this.fit,
    this.backGroundColor,
    this.border,
    this.borderRadius,
    this.margin,
  });
  final double? width, height;
  final double? borderRadius;
  final String imageUrl;
  final bool applyImageRadius;
  final bool isNetWorkImage;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final BoxFit? fit;
  final Color? backGroundColor;
  final BoxBorder? border;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backGroundColor,
              borderRadius: applyImageRadius
                  ? BorderRadius.circular(borderRadius!)
                  : BorderRadius.zero),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: isNetWorkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
