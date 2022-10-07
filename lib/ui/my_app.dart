import 'package:flutter/material.dart';
import 'package:fruity/constants/app_theme.dart';
import 'package:fruity/constants/strings.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/stores/version/version_store.dart';
import 'package:fruity/ui/auth/login.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final VersionStore _versionStore = VersionStore();

    return MultiProvider(
      providers: [
        Provider<VersionStore>(create: (_) => _versionStore),
      ],
      child: MaterialApp(
        theme: themeData,
        darkTheme: themeDataDark,
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        title: Strings.appName,
        home: LoginScreen(),
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
