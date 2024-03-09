import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TcirculerContainer extends StatelessWidget {
  const TcirculerContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.raduis = 400,
      this.padding = const EdgeInsets.all(0),
      this.backgrondColor = TColors.white,
      this.margin = 0,
      this.child});
  final double? width;
  final double? height;
  final double raduis;
  final EdgeInsetsGeometry padding;
  final Color backgrondColor;
  final double margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: margin),
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis), color: backgrondColor),
    );
  }
}
