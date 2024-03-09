import 'package:e_commerce_app/common/widgets/curves.dart';
import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TcurvedEdgeWidgets extends StatelessWidget {
  const TcurvedEdgeWidgets({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TcustomCurvedEdges(), child: child);
  }
}
