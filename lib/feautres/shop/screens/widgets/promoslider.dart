import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/common/widgets/troundedimage.dart';
import 'package:e_commerce_app/feautres/shop/controllers/home_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  TPromoSlider({super.key, required this.banners});
  final List<String> banners;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: ((index, _) =>
                    controller.updatePageIndicator(index)))),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TcirculerContainer(
                      width: 20,
                      height: 4,
                      margin: TSizes.spaceBtwItems,
                      backgrondColor: controller.carouselCurrentIndex.value == i
                          ? TColors.primary
                          : TColors.grey,
                    ),
                ],
              )),
        )
      ],
    );
  }
}
