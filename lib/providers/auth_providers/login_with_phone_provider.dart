import 'dart:developer';
import 'package:goapp/config.dart';
import '../../services/api_service.dart';
import '../../services/user_services.dart';

class LoginWithPhoneProvider with ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCodeSent = false;
  String? dialCode = "+30";
  final FocusNode phoneFocus = FocusNode();
  String? verificationCode;
  double? currentLatitude;
  double? currentLongitude;

  ContactMethod selectedMethod = ContactMethod.email;

  void changeDialCode(CountryCodeCustom country) {
    log("ssskjlhdajksdhas $dialCode ====> ${country.dialCode}");
    dialCode = country.dialCode!;
    log("ssskjlhdajksdhassss $dialCode");
    notifyListeners();
  }

  Future<void> locationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log("Location services are disabled.");
      return;
    }

    // Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("Location permission is permanently denied.");
      return;
    }

    // Get last known location for faster results
    Position? lastPosition = await Geolocator.getLastKnownPosition();

    currentLatitude = 0.0;
    currentLongitude = 0.0;

    if (lastPosition != null) {
      currentLatitude = lastPosition.latitude;
      currentLongitude = lastPosition.longitude;
      log("Using Last Known Location: Lat: $currentLatitude, Long: $currentLongitude");
    }

    // Fetch fresh location in background
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            timeLimit: Duration(seconds: 5))
        .catchError((e) {
      log("Failed to fetch fresh location: $e");
      return lastPosition;
    });

    currentLatitude = position.latitude;
    currentLongitude = position.longitude;
    log("Updated Location: Lat: $currentLatitude, Long: $currentLongitude");
    }

  TextEditingController email = TextEditingController();
  final FocusNode userNameFocus = FocusNode();

  Future<void> onTapEmailOtp(BuildContext context) async {
    verificationCode = "";
    final verifyOtp = Provider.of<VerifyOtpProvider>(context, listen: false);
    verifyOtp.otpController.text = "";
    FocusManager.instance.primaryFocus?.unfocus();

    if (globalKey.currentState!.validate()) {
      try {
        showLoading(context);
        var body = {"email": email.text};
        log("Request body: $body");

        final value = await apiServices.commonApi(api.otp, body, ApiType.post,
            isToken: false);

        log("API Response: ${value.data}");

        hideLoading(context);

        if (value.data['responseStatus'] == 1 &&
            value.data['code'] != null &&
            value.data['code'].toString().isNotEmpty) {
          route.pushNamed(context, routeName.loginPhoneOtpVerifyScreen);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token.toString());
        } else {
          showMessage(context, 'Invalid credentials');
        }
      } catch (e) {
        hideLoading(context);
        log("Error in onTapEmailOtp: $e");
        showMessage(context, 'Something went wrong');
      }
    }
  }

  Future<void> onTapOtp(BuildContext context) async {
    verificationCode = "";
    final verifyOtp = Provider.of<VerifyOtpProvider>(context, listen: false);
    verifyOtp.otpController.text = "";
    FocusManager.instance.primaryFocus?.unfocus();

    if (globalKey.currentState!.validate()) {
      try {
        showLoading(context);
        var body = {
          "phoneNumberPrefix": dialCode,
          "phoneNumber": numberController.text
        };
        log("Request body: $body");

        final value = await apiServices.commonApi(api.otp, body, ApiType.post,
            isToken: false);

        log("API Response: ${value.data}");

        hideLoading(context);

        // ✅ Check response before navigating
        if (value.data['responseStatus'] == 1 &&
            value.data['code'] != null &&
            value.data['code'].toString().isNotEmpty) {
          // Success → navigate
          route.pushNamed(context, routeName.loginPhoneOtpVerifyScreen);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token.toString());
        } else {
          // Failure → show message
          showMessage(context, "Invalid credentials");
        }
      } catch (e) {
        hideLoading(context);
        log("Error in onTapOtp: $e");
        showMessage(context, 'Something went wrong');
      }
    }
  }
}
