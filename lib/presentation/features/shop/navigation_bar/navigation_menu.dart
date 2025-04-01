import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/home_menu_bloc.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMenuBloc, HomeMenuState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
              height: 80,
              selectedIndex: state.currentHomePage ?? 0,
              onDestinationSelected: (index) {
                context
                    .read<HomeMenuBloc>()
                    .add(SetHomeMenuEvent(currentHomePage: index));
              },
              destinations: [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
                NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: "Wishlist"),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: "Profile"),
              ]),
          body: state.currentPage,
        );
      },
    );
  }
}
