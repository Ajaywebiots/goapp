import 'package:goapp/config.dart';
import 'package:goapp/screens/auth_screens/social_register_screen/social_reg_screen.dart';

import '../screens/app_pages_screen/app_setting_screen/app_setting_screen.dart';
import '../screens/app_pages_screen/attractions_details_screen/attraction_detail_screen.dart';
import '../screens/app_pages_screen/attractions_screen/attractions_screen.dart';
import '../screens/app_pages_screen/categories_list_screen/categories_list_screen.dart';
import '../screens/app_pages_screen/change_language_screen/change_language_screen.dart';
import '../screens/app_pages_screen/contact_us_screen/contact_us_screen.dart';
import '../screens/app_pages_screen/coupon_list_screen/coupon_list_screen.dart';
import '../screens/app_pages_screen/fav_screen/fav_screen_list.dart';
import '../screens/app_pages_screen/latest_blog_details/latest_blog_details.dart';
import '../screens/app_pages_screen/latest_blog_view_all/latest_blog_view_all.dart';
import '../screens/app_pages_screen/notification_screen/notification_screen.dart';
import '../screens/app_pages_screen/offer_detail_screen/offer_details_screen.dart';
import '../screens/app_pages_screen/profile_detail_screen/profile_detail_screen.dart';
import '../screens/app_pages_screen/review_screen/review_screen.dart';
import '../screens/app_pages_screen/search_screen/search_screen.dart';
import '../screens/app_pages_screen/service_review_screen/service_review_screen.dart';
import '../screens/app_pages_screen/services_details_screen/business_details_screen.dart';
import '../screens/app_pages_screen/subscription_plan_screen/subscription_plan_screen.dart';
import '../screens/auth_screens/register_screen/sign_up_verify_otp.dart';
import '../screens/auth_screens/verify_otp_screen/login_phone_otp_verify_screen.dart';
import '../screens/bottom_screens/dashboard/dashboard.dart';
import '../screens/bottom_screens/home_screen/home_screen.dart';
import '../screens/menu_screens/menu_options_layouts/common_generalInfo_layout.dart';
import '../widgets/common_gallery_screen.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash: (p0) => const SplashScreen(),
    routeName.onBoarding: (p0) => const OnBoardingScreen(),
    routeName.login: (p0) => const LoginScreen(),
    // routeName.loginWithPhone: (p0) => const LoginWithPhoneScreen(),
    routeName.verifyOtp: (p0) => const VerifyOtpScreen(),
    routeName.latestBlogViewAll: (p0) => const LatestBlogViewAll(),
    routeName.loginPhoneOtpVerifyScreen: (p0) =>
        const LoginPhoneOtpVerifyScreen(),
    // routeName.forgetPassword: (p0) => const ForgotPasswordScreen(),
    // routeName.resetPass: (p0) => const ResetPasswordScreen(),
    routeName.registerUser: (p0) => const RegisterScreen(),
    routeName.homeScreen: (p0) => const HomeScreen(),
    routeName.socialRegister: (p0) => const SocialRegScreen(),
    routeName.couponListScreen: (p0) => const CouponListScreen(),
    routeName.dashboard: (p0) => const Dashboard(),
    // routeName.categoriesDetailsScreen: (p0) => const CategoryDetailScreen(),
    routeName.categoriesListScreen: (p0) => const CategoriesListScreen(),
    routeName.notifications: (p0) => const NotificationScreen(),
    // routeName.featuredBusinessScreen: (p0) => const FeaturedBusinessScreen(),
    routeName.attractionScreen: (p0) => const AttractionScreen(),
    routeName.profileDetails: (p0) => ProfileDetailScreen(),
    routeName.contactUs: (p0) => const ContactUsScreen(),
    // routeName.providerDetailsScreen: (p0) => const ProviderDetailsScreen(),
    routeName.latestBlogDetails: (p0) => const LatestBlogDetailsScreen(),
    routeName.commonGeneralInfoLayout: (p0) => const CommonGeneralInfoLayout(),
    routeName.search: (p0) => SearchScreen(),
    routeName.changeLanguage: (p0) => ChangeLanguageScreen(),
    routeName.commonGalleryScreen: (p0) => const CommonGalleryScreen(),
    routeName.businessDetailsScreen: (p0) => const BusinessDetailsScreen(),
    routeName.attractionDetailScreen: (p0) => const AttractionDetailScreen(),
    routeName.serviceReviewScreen: (p0) => const ServiceReviewScreen(),
    routeName.offerDetailsScreen: (p0) => const OfferDetailsScreen(),
    routeName.appSetting: (p0) => const AppSettingScreen(),
    routeName.favScreenList: (p0) => FavScreenList(),
    routeName.reviewScreen: (p0) => const ReviewScreen(),
    routeName.subscriptionPlanScreen: (p0) => const SubscriptionPlanScreen(),
    // routeName.changePassInApp: (p0) => const ChangePassInApp(),
    routeName.signUpVerifyOtp: (p0) => const SignUpVerifyOtp(),
    // routeName.resetPasswordScreenInApp: (p0) =>
    //     const ResetPasswordScreenInApp(),
  };
}
