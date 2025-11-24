import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goapp/services/user_services.dart';
import 'common/theme/app_theme.dart';
import 'config.dart';
import 'firebase_options.dart';

void main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
                create: (_) => ThemeService(snapData.data!, context),
              ),
              ChangeNotifierProvider(create: (_) => SplashProvider()),
              ChangeNotifierProvider(
                create: (_) => LanguageProvider(snapData.data!),
              ),
              ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
              ChangeNotifierProvider(create: (_) => ServicesDetailsProvider()),
              ChangeNotifierProvider(create: (_) => LoginProvider()),
              ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
              ChangeNotifierProvider(create: (_) => ProfileProvider()),
              ChangeNotifierProvider(create: (_) => SignUpCompanyProvider()),
              ChangeNotifierProvider(create: (_) => ContactUsProvider()),
              ChangeNotifierProvider(create: (_) => DashboardProvider()),
              ChangeNotifierProvider(create: (_) => MyBusinessProvider()),
              ChangeNotifierProvider(create: (_) => LoginWithPhoneProvider()),
              ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
              // ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
              ChangeNotifierProvider(create: (_) => RegisterProvider()),
              ChangeNotifierProvider(create: (_) => SocialRegProvider()),
              ChangeNotifierProvider(create: (_) => SearchProvider()),
              ChangeNotifierProvider(create: (_) => MyReviewProvider()),
              ChangeNotifierProvider(create: (_) => CommonApiProvider()),
              ChangeNotifierProvider(create: (_) => BusinessReviewsProvider()),
              ChangeNotifierProvider(
                create: (_) => LatestBLogDetailsProvider(),
              ),
              ChangeNotifierProvider(create: (_) => LoadingProvider()),
              ChangeNotifierProvider(create: (_) => InAppForgotPassProvider()),
              ChangeNotifierProvider(create: (_) => DeleteDialogProvider()),
              ChangeNotifierProvider(create: (_) => AttractionProvider()),
              ChangeNotifierProvider(create: (_) => FavouriteListProvider()),
              ChangeNotifierProvider(create: (_) => NoInternetProvider()),
              ChangeNotifierProvider(
                create: (_) => VerifyResetPasswordProvider(),
              ),
              ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
              ChangeNotifierProvider(create: (_) => CommonPermissionProvider()),
              ChangeNotifierProvider(
                create: (_) => CategoriesDetailsProvider(),
              ),
              ChangeNotifierProvider(create: (_) => CategoriesListProvider()),
              ChangeNotifierProvider(create: (_) => NotificationProvider()),
              ChangeNotifierProvider(create: (_) => RateAppProvider()),
              ChangeNotifierProvider(create: (_) => TimeSlotProvider()),
              ChangeNotifierProvider(create: (_) => OfferProvider()),
              ChangeNotifierProvider(create: (_) => BusinessDetailsProvider()),
              ChangeNotifierProvider(create: (_) => BusinessTimeSlotProvider()),
              ChangeNotifierProvider(create: (_) => ProfileDetailProvider()),
              ChangeNotifierProvider(
                create: (_) => AppSettingProvider(snapData.data!),
              ),
              ChangeNotifierProvider(create: (_) => ServiceReviewProvider()),
            ],
            child: const RouteToPage(),
          );
        } else {
          return MaterialApp(
            theme: AppTheme.fromType(ThemeType.light).themeData,
            darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const SplashLayout(),
          );
        }
      },
    );
  }

  void lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class RouteToPage extends StatefulWidget {
  const RouteToPage({super.key});

  @override
  State<RouteToPage> createState() => _RouteToPageState();
}

class _RouteToPageState extends State<RouteToPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, theme, child) {
        return Consumer<LanguageProvider>(
          builder: (context, lang, child) {
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
                GlobalCupertinoLocalizations.delegate,
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
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
