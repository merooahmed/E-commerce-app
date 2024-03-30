import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.value,
    required this.text,
  });
  final double value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 13,
          child: SizedBox(
            width: THelperFunctions.screenWidth() * .5,
            child: LinearProgressIndicator(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              value: value,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              backgroundColor: TColors.grey,
              minHeight: 10,
            ),
          ),
        )
      ],
    );
  }
}
