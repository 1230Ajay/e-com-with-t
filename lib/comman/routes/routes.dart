import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/data/local/storage_service.dart';
import 'package:tapp/presentation/features/authentication/cubit/auth_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:tapp/presentation/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tapp/presentation/features/authentication/screens/password_configuration/cubit/forgot_password_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:tapp/presentation/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-in/cubit/signin_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-in/sign_in.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/cubit/sign_up_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/sign_up.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/verify_email.dart';
import 'package:tapp/presentation/features/personalisation/address/add_new_adress_form.dart';
import 'package:tapp/presentation/features/personalisation/address/address.dart';
import 'package:tapp/presentation/features/shop/all_products/all_products.dart';
import 'package:tapp/presentation/features/shop/brands/brand_products.dart';
import 'package:tapp/presentation/features/shop/brands/brands.dart';
import 'package:tapp/presentation/features/shop/cart/cart.dart';
import 'package:tapp/presentation/features/shop/checkout/check_out.dart';
import 'package:tapp/presentation/features/shop/orders/orders.dart';
import 'package:tapp/presentation/features/shop/product_reviews/product_reviews.dart';
import 'package:tapp/presentation/features/shop/sub_category/sub_category_screen.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import '../../presentation/features/personalisation/profile/bloc/profile_bloc.dart';
import '../../presentation/features/personalisation/profile/profile.dart';
import '../../presentation/features/shop/navigation_bar/bloc/home_menu_bloc.dart';
import '../../presentation/features/shop/navigation_bar/navigation_menu.dart';
import '../../presentation/features/shop/product_detail/product_detail.dart';

class Routes {
  ///  ------------------ ROUTES LIST -------------------------////

  static List<PageEntity> routes() {
    return <PageEntity>[
      PageEntity(name: AppRoutes.INITIAL, page: Onboarding(),bloc: BlocProvider(create: (_) => OnboardingBloc())),
      PageEntity(name: AppRoutes.SIGNIN, page: SignIn(),bloc: BlocProvider(create: (_) => SigninCubit())),
      PageEntity(name: AppRoutes.SIGNUP, page: SignUp(),bloc: BlocProvider(create: (_)=>SignUpCubit())),
      PageEntity(name: AppRoutes.VERIFY_EMAIL, page: VerifyEmail(),bloc: BlocProvider(create: (_)=>AuthCubit())),
      PageEntity(name: AppRoutes.FORGOT_PASSWORD, page: ForgotPassword(),bloc: BlocProvider(create: (_)=>ForgotPasswordCubit())),
      PageEntity(name: AppRoutes.RESET_PASSWORD, page: ResetPassword()),
      PageEntity(name: AppRoutes.HOME_MENU,page: NavigationMenu(),bloc: BlocProvider(create: (_) => HomeMenuBloc())),
      PageEntity(name: AppRoutes.PROFILE,page: ProfilePage(),bloc: BlocProvider(create: (_) => ProfileBloc())),
      PageEntity(name: AppRoutes.PRODUCT_DETAIL, page: ProductDetail()),
      PageEntity(name: AppRoutes.PRODUCT_REVIEWS, page: ProductReviews()),
      PageEntity(name: AppRoutes.USER_ADRESS, page: UserAddress()),
      PageEntity(name: AppRoutes.ADD_NEW_ADDRESS, page: AddNewAdressScreen()),
      PageEntity(name: AppRoutes.CART, page: Cart()),
      PageEntity(name: AppRoutes.CHECK_OUT, page: CheckOut()),
      PageEntity(name: AppRoutes.ORDERS, page: Orders()),
      PageEntity(name: AppRoutes.SUB_CATEGORY_SCREEN, page: SubCategoryScreen()),
      PageEntity(name: AppRoutes.ALL_PRODUCTS, page: AllProducts()),
      PageEntity(name: AppRoutes.BRANDS, page: Brands()),
      PageEntity(name: AppRoutes.BRAND_PRODUCTS, page: BrandProducts())
    ];
  }

  /// ---------------------- EXRACTING BLOC PROVIDERS ----------------///

  static List<BlocProvider> allBlocProviders() {
    List<BlocProvider> blocProviders = <BlocProvider>[];

    for (var provider in routes()) {
      if (provider.bloc != null) {
        blocProviders.add(provider.bloc);
      }
    }
    return blocProviders;
  }

  /// --------------------------- IMLEMENT ROUTES ------------------------///

  static MaterialPageRoute onGeneratePageRoute(RouteSettings settings) {
    var result = routes().where((route) => route.name == settings.name);

    bool isOpened = StorageService.instance.isAppOpened();
    User? user = FirebaseAuth.instance.currentUser;

    if (result.isNotEmpty) {

      if(isOpened && result.first.name==AppRoutes.INITIAL){
        if(user!=null){
          if (user.emailVerified) {
            return MaterialPageRoute(
                builder: (_) => NavigationMenu(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => VerifyEmail(), settings: settings);
          }
        }else{
           return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
        }

      }

      return MaterialPageRoute(
          builder: (_) => result.first.page, settings: settings);
    }

    return MaterialPageRoute(
        builder: (_) => SignIn(), settings: settings);
  }
}

/// ------------------------ PAGE ENTITY ---------------------------///
class PageEntity {
  final String name;
  final Widget page;
  dynamic bloc;
  PageEntity({required this.name, required this.page, this.bloc});
}
