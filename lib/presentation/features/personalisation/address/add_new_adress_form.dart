import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class AddNewAdressScreen extends StatelessWidget {
  const AddNewAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Add new Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user), label: Text("Name"))),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile), label: Text("Name"))),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              label: Text("Street")))),
                  const SizedBox(
                    width: AppSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              label: Text("Postal Code"))))
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              label: Text("City")))),
                  const SizedBox(
                    width: AppSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              label: Text("State"))))
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      label: Text("Country"))),
              const SizedBox(
                height: AppSizes.defaultSpace,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Save")),
              )
            ],
          )),
        ),
      ),
    );
  }
}
