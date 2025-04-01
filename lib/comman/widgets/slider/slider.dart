import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../images/rounded_image.dart';

class TSlider extends StatefulWidget {
  const TSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  State<TSlider> createState() => _TSliderState();
}

class _TSliderState extends State<TSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(widget.banners.length, (index) {
            return TRoundedImage(
                imageUrl: widget.banners[index], applyImageRadius: true);
          }),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers indicators
          children: List.generate(
            widget.banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Smooth transition
              curve: Curves.easeInOut, // Easing effect
              width: activeIndex == index ? 24 : 10, // Expands active indicator
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color:
                    activeIndex == index ? AppColors.primary : AppColors.grey,
                borderRadius:
                    BorderRadius.circular(AppSizes.md), // Smooth rounded edges
              ),
            ),
          ),
        ),
      ],
    );
  }
}
