import 'package:goapp/config.dart';

import '../screens/menu_screens/layouts/my_business_layout/add_business_user_screen.dart';
import '../screens/menu_screens/layouts/my_business_layout/business_user_screen.dart';
import '../screens/menu_screens/layouts/my_business_layout/my_business_screen.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash: (p0) => const SplashScreen(),
    routeName.onBoarding: (p0) => const OnBoardingScreen(),
    routeName.login: (p0) => const LoginScreen(),
    routeName.verifyOtp: (p0) => const VerifyOtpScreen(),
    routeName.latestBlogViewAll: (p0) => const LatestBlogViewAll(),
    routeName.loginPhoneOtpVerifyScreen: (p0) =>
        const LoginPhoneOtpVerifyScreen(),
    routeName.registerUser: (p0) => const RegisterScreen(),
    routeName.homeScreen: (p0) => const HomeScreen(),
    routeName.socialRegister: (p0) => const SocialRegScreen(),
    routeName.couponListScreen: (p0) => const CouponListScreen(),
    routeName.dashboard: (p0) => const Dashboard(),
    routeName.categoriesListScreen: (p0) => const CategoriesListScreen(),
    routeName.notifications: (p0) => const NotificationScreen(),
    routeName.attractionScreen: (p0) => const AttractionScreen(),
    routeName.profileDetails: (p0) => ProfileDetailScreen(),
    routeName.contactUs: (p0) => const ContactUsScreen(),
    routeName.latestBlogDetails: (p0) => const LatestBlogDetailsScreen(),
    routeName.commonGeneralInfoLayout: (p0) => const CommonGeneralInfoLayout(),
    routeName.search: (p0) => SearchScreen(),
    routeName.changeLanguage: (p0) => ChangeLanguageScreen(),
    routeName.businessDetailsScreen: (p0) => const BusinessDetailsScreen(),
    routeName.attractionDetailScreen: (p0) => const AttractionDetailScreen(),
    routeName.serviceReviewScreen: (p0) => const ServiceReviewScreen(),
    routeName.offerDetailsScreen: (p0) => const OfferDetailsScreen(),
    routeName.appSetting: (p0) => const AppSettingScreen(),
    routeName.favScreenList: (p0) => FavScreenList(),
    routeName.reviewScreen: (p0) => const ReviewScreen(),
    routeName.subscriptionPlanScreen: (p0) => const SubscriptionPlanScreen(),
    routeName.payPalSubscriptionPage: (p0) => PayPalSubscriptionPage(),
    routeName.signUpVerifyOtp: (p0) => const SignUpVerifyOtp(),
    routeName.companyDetailsScreen: (p0) => const CompanyDetailsScreen(),
    routeName.menuScreen: (p0) => const MenuScreen(),
    routeName.businessReviewsScreen: (p0) => const BusinessReviewsScreen(),
    routeName.businessOfferScreen: (p0) => const BusinessOfferScreen(),
    routeName.offerBookings: (p0) => const OfferBookingScreen(),
    routeName.businessDashBoardScreen: (p0) => BusinessDashboardScreen(),
    routeName.businessOfferDetails: (p0) => const BusinessOfferDetails(),
    routeName.myBusinessScreen: (p0) => const MyBusinessScreen(),
    routeName.businessUserScreen: (p0) => const BusinessUserScreen(),
    routeName.addBusinessUserScreen: (p0) => const AddBusinessUserScreen(),
  };
}
