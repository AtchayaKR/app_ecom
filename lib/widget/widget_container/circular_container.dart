import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    required this.radius,
    this.height,
    this.width,
    this.showColor = false,
    this.showImage = false,
    this.isNetworkImage = false,
    this.margin,
    this.padding = 0,
    this.backGroundColor = Colors.transparent,
    this.borderRadius = 0,
    this.color,
    this.child,
    this.circularImage,
  });

  final double? height, width;
  final bool showColor, showImage, isNetworkImage;
  final Color? color;
  final Color backGroundColor;
  final double radius, padding, borderRadius;
  final EdgeInsets? margin;
  final Widget? child;
  final String? circularImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        backgroundColor: backGroundColor,
        child: Container(
            height: height,
            width: width,
            margin: margin,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                image: showImage
                    ? DecorationImage(
                        image: isNetworkImage
                            ? NetworkImage(circularImage!)
                            : AssetImage(circularImage!) as ImageProvider)
                    : null,
                borderRadius: BorderRadius.circular(borderRadius),
                color: showColor ? color : Colors.transparent),
            child: child));
  }
}
