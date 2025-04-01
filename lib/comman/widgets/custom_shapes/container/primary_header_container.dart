import 'package:flutter/cupertino.dart';

import '../../../../core/utils/constants/colors.dart';
import '../curved_edges/top_curved_edges.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TopCurvedEdgesWidget(
      child: Container(
        width: double.infinity,
        color: AppColors.primary,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TCircullarContainer(
                  backGroundColor: AppColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -320,
                child: TCircullarContainer(
                  backGroundColor: AppColors.textWhite.withOpacity(0.1),
                )),
            child
          ],
        ),
      ),
    );
  }
}
