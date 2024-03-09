import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tcurvededge_widgets.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeader extends StatelessWidget {
  const TPrimaryHeader({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TcurvedEdgeWidgets(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 450,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -200,
                  child: TcirculerContainer(
                    backgrondColor: TColors.textWhite.withOpacity(0.1),
                  )),
              Positioned(
                  top: 100,
                  right: -250,
                  child: TcirculerContainer(
                    backgrondColor: TColors.textWhite.withOpacity(0.1),
                  )),
child,
              // Column(children: [],)
            ],
          ),
        ),
      ),
    );
  }
}
