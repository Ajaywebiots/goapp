//app file

import 'package:goapp/screens/dashboard_screens/home_screen.dart';

import '../config.dart';
import '../screens/auth_screens/verify_otp_screen/verify_otp_screen1.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    routeName.splash: (p0) => const SplashScreen(),
    routeName.onBoarding: (p0) => const OnBoardingScreen(),
    routeName.login: (p0) => const LoginScreen(),
    routeName.loginWithPhone: (p0) => const LoginWithPhoneScreen(),
    routeName.verifyOtp: (p0) => const VerifyOtpScreen(),
    routeName.verifyOtp1: (p0) => const VerifyOtpScreen1(),
    routeName.forgetPassword: (p0) => const ForgotPasswordScreen(),
    routeName.resetPass: (p0) => const ResetPasswordScreen(),
    routeName.registerUser: (p0) => const RegisterScreen(),
    routeName.changePass: (p0) => const ChangePasswordScreen(),
    routeName.homeScreen: (p0) => const HomeScreen(),
  };
}
