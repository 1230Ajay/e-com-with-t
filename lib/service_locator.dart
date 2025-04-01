import 'package:get_it/get_it.dart';
import 'package:tapp/data/features/authentication/datasource/authentication_api_service.dart';
import 'package:tapp/data/features/authentication/repositories/authentication_impl.dart';

import 'package:tapp/domain/features/authentication/repositories/authentication.dart';
import 'package:tapp/domain/features/authentication/usecases/email_verification_status.dart';
import 'package:tapp/domain/features/authentication/usecases/google_signin.dart';
import 'package:tapp/domain/features/authentication/usecases/send_reset_password_email.dart';
import 'package:tapp/domain/features/authentication/usecases/signin_usecase.dart';
import 'package:tapp/domain/features/authentication/usecases/signup_usecase.dart';

import 'data/features/presonalisation/datasource/user_api_service.dart';
import 'data/features/presonalisation/repositories/user_impl.dart';
import 'data/features/shop/home/datasource/categorie_api_service.dart';
import 'data/features/shop/home/repositories/categories_impl.dart';
import 'domain/features/authentication/usecases/send_email_verification.dart';
import 'domain/features/personalisation/repositories/user.dart';
import 'domain/features/shop/home/repositories/categories.dart';
import 'domain/features/shop/home/usecases/shop/categories.dart';

class ServiceLocator {
  // Singleton instance
  static final ServiceLocator instance = ServiceLocator._internal();

  // Private constructor
  ServiceLocator._internal();

  // GetIt instance
  final GetIt getIt = GetIt.instance;

  void setup() {
    /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~ REPOSITORIES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///
    /// ---> Authentication
    getIt.registerSingleton<AuthenticationRepository>(
        AuthenticationRepositoryImpl());

    /// ---> Personilisation
    getIt.registerSingleton<UserRepository>(UserRepositoryImpl());

    /// ---> Shop
    getIt.registerSingleton<CategoriesRepository>(CategoriesReposiotyImpl());

    /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~ SERVICES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///
    /// ---> Authentication
    getIt.registerSingleton<AuthenticationApiService>(
        AuthenticationApiServiceImpl());

    /// ---> Personilisation
    getIt.registerSingleton<UserApiService>(UserApiServiceImpl());

    /// ---> Shop
    getIt.registerSingleton<CategoriesApiService>(CategoriesApiServiceImpl());

    /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~ USECASES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///

    /// ----> Authentication
    getIt.registerSingleton<SignInUsecase>(SignInUsecase());
    getIt.registerSingleton<SignupUsecase>(SignupUsecase());
    getIt.registerSingleton<SendEmailVerificationUseCase>(
        SendEmailVerificationUseCase());
    getIt.registerSingleton<EmailVerificationStatusUseCase>(
        EmailVerificationStatusUseCase());
    getIt.registerSingleton<GoogleSignInUseCase>(GoogleSignInUseCase());
    getIt.registerSingleton<SendResetPasswordEmailUseCase>(
        SendResetPasswordEmailUseCase());

    /// ---> SHOP
    /// -------> Home
    getIt.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
    getIt.registerSingleton<UploadCategoriesUseCase>(UploadCategoriesUseCase());
  }

  // Helper method to access dependencies
  T get<T extends Object>() => getIt<T>();
}
