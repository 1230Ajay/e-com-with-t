import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/presentation/features/shop/home/bloc/home_bloc.dart';

import '../../../../../comman/widgets/image_text/vertical_image_text.dart';
import '../../../../../core/utils/constants/images.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = context.read<HomeBloc>();
    bloc.add(GetCategoriesEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesLoadedState) {
          return SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TVerticalImageText(
                    isNetworkImage: true,
                    image: state.categories[index].image,
                    title: state.categories[index].name,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.SUB_CATEGORY_SCREEN),
                  );
                }),
          );
        } else {
          return SizedBox(
            child: Text("Hello there"),
          );
        }
      },
    );
  }
}
