import 'package:flutter/material.dart';
import 'package:my_app/Pages/devices_screen.dart';
import 'package:my_app/Pages/home_screen.dart';
import 'package:my_app/Pages/splash_screen.dart';
import 'package:my_app/drawer_pages/User_View.dart';
import 'package:my_app/rest_api/Update_pages/update_device.dart';
import 'package:my_app/rest_api/Update_pages/update_home.dart';
import 'package:my_app/rest_api/Update_pages/update_user.dart';
import 'package:my_app/rest_api/Update_pages/update_zone.dart';
import 'package:my_app/rest_api/create_pages/create_device.dart';
import 'package:my_app/rest_api/create_pages/create_user.dart';
import 'package:my_app/rest_api/create_pages/create_zone.dart';
import 'package:my_app/settingsdirectory/language_constants.dart';
import 'package:my_app/settingsdirectory/theme_notifier.dart';
import 'Pages/zones_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'rest_api/create_pages/create_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xffF5591F),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: SplashScreen(),
      routes: {
        'user_view': (context) => UserView(),
        'createuser': (context) => CreateUser(),
        'updateuser': (context) => UpdateUser(),
        'zone_view': (context) => ZonesScreen(),
        'createzone': (context) => CreateZone(),
        'updatezone': (context) => UpdateZone(),
        'device_view': (context) => DevicesScreen(),
        'createdevice': (context) => CreateDevice(),
        'updatedevice': (context) => UpdateDevice(),
        'home_view': (context) => HomeScreen(),
        'createhome': (context) => CreateHome(),
        'updatehome': (context) => UpdateHome(),
      },
    );
  }
}
