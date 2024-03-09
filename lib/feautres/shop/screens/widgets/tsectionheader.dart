import 'package:flutter/material.dart';

class TSectionHeader extends StatelessWidget {
  const TSectionHeader({
    super.key,
    this.onpressed,
    required this.title,
    this.buttonTittle = 'View all',
    this.showactionbutton = true,
    this.textColor,
  });
  final void Function()? onpressed;
  final String title, buttonTittle;
  final bool showactionbutton;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showactionbutton)
          TextButton(onPressed: onpressed, child: Text(buttonTittle))
      ],
    );
  }
}
