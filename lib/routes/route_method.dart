//app file

import 'package:goapp/screens/auth_screens/social_register_screen/social_reg_screen.dart';

import '../config.dart';
import '../screens/auth_screens/verify_otp_screen/login_phone_otp_verify_screen.dart';
import '../screens/bottom_screens/dashboard/dashboard.dart';
import '../screens/bottom_screens/home_screen/home_screen.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash: (p0) => const SplashScreen(),
    routeName.onBoarding: (p0) => const OnBoardingScreen(),
    routeName.login: (p0) => const LoginScreen(),
    routeName.loginWithPhone: (p0) => const LoginWithPhoneScreen(),
    routeName.verifyOtp: (p0) => const VerifyOtpScreen(),
    routeName.loginPhoneOtpVerifyScreen: (p0) =>
        const LoginPhoneOtpVerifyScreen(),
    routeName.forgetPassword: (p0) => const ForgotPasswordScreen(),
    routeName.resetPass: (p0) => const ResetPasswordScreen(),
    routeName.registerUser: (p0) => const RegisterScreen(),
    routeName.homeScreen: (p0) => const HomeScreen(),
    routeName.socialRegister: (p0) => const SocialRegScreen(),
    routeName.dashboard: (p0) => const Dashboard(),
  };
}
