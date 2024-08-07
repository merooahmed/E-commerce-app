import 'package:e_commerce_app/feautres/shop/screens/categories/subcategory_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tverticalimagetext.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'shoes',
            onTap: () {
              Get.to(() => const SubCategoryScreen());
            },
          );
        },
      ),
    );
  }
}
