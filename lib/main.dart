import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goapp/services/user_services.dart';
import 'package:upgrader/upgrader.dart';

import 'common/theme/app_theme.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
/*  await initializeAppSettings();

  String? jsonString = sharedPreferences.getString("apiJsonData");
  log("selectedLocale:::$jsonString");
  sharedPreferences.getString("selectedLocale");
  log("=-=-=-=-=-=-=-=-=- ${sharedPreferences.getString("selectedLocale")}");*/
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    lockScreenPortrait();
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context1, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!, context)),
                  ChangeNotifierProvider(create: (_) => SplashProvider()),
                  ChangeNotifierProvider(
                      create: (_) => LanguageProvider(snapData.data!)),
                  ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
                  ChangeNotifierProvider(create: (_) => LoginProvider()),
                  ChangeNotifierProvider(
                      create: (_) => LoginWithPhoneProvider()),
                  ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ForgetPasswordProvider()),
                  ChangeNotifierProvider(create: (_) => RegisterProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ResetPasswordProvider()),
                  ChangeNotifierProvider(create: (_) => LoadingProvider()),
                  ChangeNotifierProvider(create: (_) => NoInternetProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ChangePasswordProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CommonPermissionProvider()),
                ],
                child: UpgradeAlert(
                    dialogStyle: UpgradeDialogStyle.cupertino,
                    showIgnore: false,
                    showLater: false,
                    barrierDismissible: false,
                    upgrader: Upgrader(
                        storeController: UpgraderStoreController(
                            onAndroid: () => UpgraderPlayStore())),
                    child: const RouteToPage()));
          } else {
            return MaterialApp(
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: UpgradeAlert(
                    showIgnore: false,
                    showLater: false,
                    barrierDismissible: false,
                    dialogStyle: UpgradeDialogStyle.cupertino,
                    upgrader: Upgrader(
                        storeController: UpgraderStoreController(
                            onAndroid: () => UpgraderPlayStore())),
                    child: const SplashLayout()));
          }
        });
  }

  lockScreenPortrait() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}

class RouteToPage extends StatefulWidget {
  const RouteToPage({super.key});

  @override
  State<RouteToPage> createState() => _RouteToPageState();
}

class _RouteToPageState extends State<RouteToPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, theme, child) {
      return Consumer<LanguageProvider>(builder: (context, lang, child) {
        return MaterialApp(
            title: 'Go App',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.fromType(ThemeType.light).themeData,
            darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
            locale: lang.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              AppLocalizationDelagate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            // Add the supported locales if needed
            themeMode: theme.theme,
            initialRoute: "/",
            routes: appRoute.route,
            // Wrap MaterialApp with Directionality
            builder: (context, child) {
              return Directionality(
                  textDirection: locale?.languageCode == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child!);
            });
      });
    });
  }
}
