import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.border,
      this.fit=BoxFit.contain,
      this.padding,
      this.isNetworkImage = false,
      this.ontap,
      this.backgroundcolor});
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? ontap;
  final Color? backgroundcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(TSizes.md)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(TSizes.md)
              : BorderRadius.zero,
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
