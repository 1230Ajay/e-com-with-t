import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(AppSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Coupon",
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
              width: 96,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: THelperFunctions.isDarkMode(context)
                      ? AppColors.white.withOpacity(0.5)
                      : AppColors.dark.withOpacity(0.5),
                  side: BorderSide(color: AppColors.grey.withOpacity(0.1)),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
                child: Text("Apply"),
              ))
        ],
      ),
    );
  }
}
