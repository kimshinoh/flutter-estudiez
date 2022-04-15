import 'package:flutter/material.dart';
import 'package:fruity/constants/app_theme.dart';
import 'package:fruity/constants/strings.dart';
import 'package:fruity/data/local/datasource/cart_datasource.dart';
import 'package:fruity/di/setup_di.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/stores/user_address/user_address_store.dart';
import 'package:fruity/ui/splash/splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = AuthStore();

    _authStore.setupUpdateUser();

    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => _authStore),
        Provider<CartStore>(create: (_) => CartStore(getIt<CartDataSource>())),
      ],
      child: MaterialApp(
          theme: themeData,
          darkTheme: themeDataDark,
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          title: Strings.appName,
          home: const SplashScreen(),
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              child: child!,
            );
          }),
    );
  }
}
