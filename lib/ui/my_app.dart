import 'package:flutter/material.dart';
import 'package:fruity/constants/app_theme.dart';
import 'package:fruity/constants/strings.dart';
import 'package:fruity/data/local/datasource/cart_datasource.dart';
import 'package:fruity/data/local/datasource/search_history_datasource.dart';
import 'package:fruity/di/setup_di.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/cart/cart_store.dart';
import 'package:fruity/stores/location/location.dart';
import 'package:fruity/stores/search_history/search_history_store.dart';
import 'package:fruity/stores/user/auth_store.dart';
import 'package:fruity/ui/splash/splash.dart';
import 'package:fruity/utils/fcm.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FCMService.init();
  }

  @override
  Widget build(BuildContext context) {
    final AuthStore _authStore = AuthStore();
    final CartStore _cartStore = CartStore(getIt<CartDataSource>());
    final LocationStore _locationStore = LocationStore();
    _cartStore.setupUpdateParent();
    _authStore.setupUpdateUser();

    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => _authStore),
        Provider<CartStore>(create: (_) => _cartStore),
        Provider<SearchHistoryStore>(
          create: (_) => SearchHistoryStore(getIt<SearchHistoryDataSource>()),
        ),
        Provider<LocationStore>(
          create: (_) => _locationStore,
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        darkTheme: themeDataDark,
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        title: Strings.appName,
        home: const SplashScreen(),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData mediaQueryData = MediaQuery.of(context);
          final double scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!,
          );
        },
      ),
    );
  }
}
