import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../../comman/widgets/products/shortable/shortable_widget.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Popular Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: TShortTableWidget(),
        ),
      ),
    );
  }
}
