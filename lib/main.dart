import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/comman/routes/routes.dart';
import 'package:tapp/data/local/storage_service.dart';
import 'package:tapp/firebase_options.dart';
import 'package:tapp/presentation/features/shop/home/bloc/home_bloc.dart';
import 'package:tapp/service_locator.dart';
import 'package:tapp/core/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ServiceLocator.instance.setup(); // Ensure this does not access Firebase before initialization
  await StorageService.init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          ...Routes.allBlocProviders(),
          BlocProvider(create: (_)=>HomeBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: Routes.onGeneratePageRoute,
        ));
  }
}
