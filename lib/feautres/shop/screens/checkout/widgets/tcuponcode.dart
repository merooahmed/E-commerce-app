import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCuponCode extends StatelessWidget {
  const TCuponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? TColors.white.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))),
                child: const Text('Apply'),
              ))
        ],
      ),
    );
  }
}
