import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/tcartcounter_icon.dart';
import 'package:e_commerce_app/common/widgets/tshimmer_widget.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/feautres/shop/screens/productcart/cart.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  THomeAppBar({
    super.key,
  });
  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: TColors.grey,
                  )),
          Obx(() {
            if (userController.profileLoading.value) {
              return const TshimmerEffect(height: 15, width: 80);
            } else {
             return Text(userController.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: TColors.white,
                      ));
            }
          })
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {
            Get.to(() => const CartScreen());
          },
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
