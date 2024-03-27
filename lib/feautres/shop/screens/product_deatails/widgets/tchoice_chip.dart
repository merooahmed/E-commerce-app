import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final iscolor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        // ignore: unnecessary_const
        label: iscolor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: iscolor
            ? TcirculerContainer(
                width: 80,
                height: 80,
                backgrondColor: THelperFunctions.getColor(text)!,
              )
            : null,
        labelPadding: iscolor ? const EdgeInsets.all(0) : null,
        padding: iscolor ? const EdgeInsets.all(0) : null,
        shape: iscolor ? const CircleBorder() : null,
        backgroundColor: iscolor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
