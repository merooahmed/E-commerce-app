import 'package:e_commerce_app/common/widgets/circular_image.dart';
import 'package:e_commerce_app/common/widgets/tshimmer_widget.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileWidgets extends StatelessWidget {
  TUserProfileWidgets({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  final controller = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return controller.imageUploading.value
            ? const TshimmerEffect(
                height: 50,
                width: 50,
                radius: 50,
              )
            : TCircularImage(
                image: image,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
                padding: 0,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}

