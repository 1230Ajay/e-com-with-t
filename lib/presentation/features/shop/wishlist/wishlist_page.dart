import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/icons/circular_icon.dart';
import 'package:tapp/comman/layout/grid_layout.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/products/cards/product_card_vertical.dart';

import 'package:tapp/core/utils/constants/sizes.dart';

import '../navigation_bar/bloc/home_menu_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        action: [
          TCircularIcon(
              icon: Iconsax.add,
              onPress: () {
                context
                    .read<HomeMenuBloc>()
                    .add(SetHomeMenuEvent(currentHomePage: 0));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) {
                    return TProductCardVertical();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
