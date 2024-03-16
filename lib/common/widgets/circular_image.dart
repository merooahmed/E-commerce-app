import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit=BoxFit.cover,
    required this.image,
     this.isNetworkImage=false,
    this.overlaycolor,
    this.backgroungcolor,
    this.width=56,
     this.height=56,
    this.padding= TSizes.sm,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor, backgroungcolor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : TColors.white,
          borderRadius: BorderRadius.circular(100)),
      child:  Image(image: isNetworkImage?NetworkImage(image):AssetImage(image)as ImageProvider,fit: fit,color: overlaycolor,),
    );
  }
}
