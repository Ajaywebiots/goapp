import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goapp/providers/app_pages_provider/categories_details_provider.dart';
import 'package:goapp/providers/app_pages_provider/categories_list_provider.dart';
import 'package:goapp/providers/app_pages_provider/expert_service_provider.dart';
import 'package:goapp/providers/app_pages_provider/favourite_list_provider.dart';
import 'package:goapp/providers/app_pages_provider/featured_service_provider.dart';
import 'package:goapp/providers/app_pages_provider/latest_blog_details_provider.dart';
import 'package:goapp/providers/app_pages_provider/notification_provider.dart';
import 'package:goapp/providers/app_pages_provider/provider_details_provider.dart';
import 'package:goapp/providers/app_pages_provider/rate_app_provider.dart';
import 'package:goapp/providers/app_pages_provider/search_provider.dart';
import 'package:goapp/providers/app_pages_provider/service_review_provider.dart';
import 'package:goapp/providers/app_pages_provider/services_details_provider.dart';
import 'package:goapp/providers/auth_providers/social_register_provider.dart';
import 'package:goapp/providers/auth_providers/verify_reset_password_provider.dart';
import 'package:goapp/providers/bottom_providers/booking_provider.dart';
import 'package:goapp/providers/bottom_providers/cart_provider.dart';
import 'package:goapp/providers/bottom_providers/dashboard_provider.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:goapp/providers/bottom_providers/profile_provider.dart';
import 'package:goapp/services/user_services.dart';
import 'package:upgrader/upgrader.dart';
import 'common/theme/app_theme.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                  ChangeNotifierProvider(
                      create: (_) => ServicesDetailsProvider()),
                  ChangeNotifierProvider(create: (_) => LoginProvider()),
                  ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
                  ChangeNotifierProvider(create: (_) => ProfileProvider()),
                  ChangeNotifierProvider(
                      create: (_) => FeaturedBusinessProvider()),
                  ChangeNotifierProvider(create: (_) => BookingProvider()),
                  // ChangeNotifierProvider(create: (_) => ProviderDetailsProvider()),
                  ChangeNotifierProvider(create: (_) => CartProvider()),
                  ChangeNotifierProvider(create: (_) => DashboardProvider()),
                  ChangeNotifierProvider(
                      create: (_) => LoginWithPhoneProvider()),
                  ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ForgetPasswordProvider()),
                  ChangeNotifierProvider(create: (_) => RegisterProvider()),
                  ChangeNotifierProvider(create: (_) => SocialRegProvider()),
                  ChangeNotifierProvider(create: (_) => SearchProvider()),
                  ChangeNotifierProvider(
                      create: (_) => LatestBLogDetailsProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ResetPasswordProvider()),
                  ChangeNotifierProvider(create: (_) => LoadingProvider()),
                  ChangeNotifierProvider(create: (_) => DeleteDialogProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ExpertServiceProvider()),
                  ChangeNotifierProvider(
                      create: (_) => FavouriteListProvider()),
                  ChangeNotifierProvider(create: (_) => NoInternetProvider()),
                  ChangeNotifierProvider(
                      create: (_) => VerifyResetPasswordProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ChangePasswordProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CommonPermissionProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CategoriesDetailsProvider()),
                  ChangeNotifierProvider(
                      create: (_) => CategoriesListProvider()),
                  ChangeNotifierProvider(create: (_) => NotificationProvider()),
                  ChangeNotifierProvider(create: (_) => RateAppProvider()),
                  ChangeNotifierProvider(
                      create: (_) => ServiceReviewProvider()),
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
                home: const SplashLayout());
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
            supportedLocales: appArray.localList,
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
                  textDirection: locale?.languageCode == 'he'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child!);
            });
      });
    });
  }
}
