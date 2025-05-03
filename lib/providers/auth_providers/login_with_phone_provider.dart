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
  CountryCodeCustom? selectedCountry;

  void changeDialCode(CountryCodeCustom country) {
    selectedCountry = country;
    dialCode = country.dialCode;
    notifyListeners();
  }

  locationPermission() async {
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
            timeLimit: Duration(
                seconds: 5)) // If it takes too long, return what we have
        .catchError((e) {
      log("Failed to fetch fresh location: $e");
      return lastPosition; // Use last known location if fresh location fails
    });

    if (position != null) {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
      log("Updated Location: Lat: $currentLatitude, Long: $currentLongitude");
    }
  }

  onTapOtp(context) {
    verificationCode = "";
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      try {
        showLoading(context);
        var body = {
          "phoneNumberPrefix": dialCode,
          "phoneNumber": numberController.text
        };
        log("ddd ${body}");
        apiServices
            .commonApi(api.otp, body, ApiType.post, isToken: false)
            .then((value) async {
          log("dasdasdasd ${value.data}");
          route.pushNamed(context, routeName.loginPhoneOtpVerifyScreen,
              arg: body);
          hideLoading(context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          log("token.toString ${token.toString()}");
          await prefs.setString('authToken', token.toString());
          log("ssss ${value.data}");
          log("ssss ${value.data['code']}");
          /*if (value.data['code'].isNotEmpty) {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // log("token.toString ${token.toString()}");
            // await prefs.setString('authToken', token.toString());
            log("ssss ${value.data}");
            log("ssss ${value.data['code']}");
            hideLoading(context);

          } else {
            hideLoading(context);
            showMessage(context, value.data['responseMessage']);
          }*/
        });
      } catch (e) {
        hideLoading(context);
        log("EEEE : login $e");
      }
    }
  }

////
}
