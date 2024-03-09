import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCirculerIcon extends StatelessWidget {
  const TCirculerIcon({
    super.key,
    this.height,
    this.width,
    this.size = 20,
    this.iconColor,
    this.backgroundcolor,
    required this.icon,
    this.onPressed,
  });
  final double? height, width, size;
  final Color? iconColor;
  final Color? backgroundcolor;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: backgroundcolor != null
            ? backgroundcolor!
            : dark
                ? TColors.black.withOpacity(0.1)
                : TColors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(100), ///////??????
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.heart5,
            color: iconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
