import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key, required this.textDivider,
  });
  final String textDivider;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        Flexible(
            child: Divider(
          color: dark ? TColors.darkGrey : TColors.grey,
          indent: 60,
          endIndent: 5,
          thickness: 0.5,
        )),
        Text(textDivider),
        Flexible(
            child: Divider(
          color: dark ? TColors.darkGrey : TColors.grey,

          indent: 5,
          endIndent: 60,
          thickness: 0.5,
        )),
      ],
    );
  }
}
