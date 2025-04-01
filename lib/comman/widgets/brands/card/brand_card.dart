import 'package:flutter/material.dart';

import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../images/circullar_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.title = "",
    this.subtTitle = "",
    this.image = "",
    this.showBorder = false,
    this.onTap,
  });

  final String? title, subtTitle, image;
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: TRoundedContainer(
        padding: EdgeInsets.all(AppSizes.sm),
        backGroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
            /// --- Icon
            Flexible(
                child: image != null
                    ? TCircularImage(
                        image: image!,
                        backgroundColor: Colors.transparent,
                        isNetworkImage: false,
                      )
                    : SizedBox()),
            SizedBox(
              width: AppSizes.spaceBtwItems / 4,
            ),

            /// --- Text
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleTextWithVerifiedIcon(
                      title: title ?? "",
                      brandTextSize: TextSizes.medium,
                    ),
                    Text(subtTitle ?? "",
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
