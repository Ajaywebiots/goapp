import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:goapp/config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SharedPreferences? pref;

  // final FocusNode userNameFocus = FocusNode();
  // final FocusNode passwordFocus = FocusNode();
  // bool isPassword = true;

  void onLogin(context) {
    /* FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      login(context);
    }*/
  }


  void guestLogin(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(session.isContinueAsGuest, true);
    route.pushReplacementNamed(context, routeName.dashboard);

    final homePvr =
    Provider.of<HomeScreenProvider>(context, listen: false);
    homePvr.homeFeed(context);
    Provider.of<LatestBLogDetailsProvider>(context, listen: false)
        .getArticlesSearchAPI(context);
    final attractionPvr =
    Provider.of<AttractionProvider>(context, listen: false);

    attractionPvr.getAttractionSearchAPI(context);
    final searchPvr =
    Provider.of<SearchProvider>(context, listen: false);
    searchPvr.getBusinessSearchAPI(context, isFilter: false);
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    offerPvr.getViewAllOfferAPI();
  }


  // autoFetch() {
  //   userName.text = "apptest123";
  //   passwordController.text = "123456";
  //   notifyListeners();
  // }

  // password see tap
  // passwordSeenTap() {
  //   isPassword = !isPassword;
  //   notifyListeners();
  // }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  double? currentLatitude;
  double? currentLongitude;

  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

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

    Position? lastPosition = await Geolocator.getLastKnownPosition();

    currentLatitude = 0.0;
    currentLongitude = 0.0;

    if (lastPosition != null) {
      currentLatitude = lastPosition.latitude;
      currentLongitude = lastPosition.longitude;
      log("Using Last Known Location: Lat: $currentLatitude, Long: $currentLongitude");
    }

    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 5))
        .catchError((e) {
      log("Failed to fetch fresh location: $e");
      return lastPosition!;
    });

    currentLatitude = position.latitude;
    currentLongitude = position.longitude;
    log("Updated Location: Lat: $currentLatitude, Long: $currentLongitude");
  }

  Future<void> signInWithGoogle(context) async {
    try {
      locationPermission();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      log("userCredential ${userCredential.user?.email}");
      log("userCredential ${userCredential.user?.displayName}");
      log("userCredential ${userCredential.user?.phoneNumber}");

      route.pushNamed(context, routeName.dashboard, arg: userCredential);
    } catch (e) {
      log("Error in Google Sign-In: $e");
    }
  }

  //login
  /*login(context) async {
    showLoading(context);
    try {
      var body = {
        "username": userName.text,
        "password": passwordController.text
      };
      apiServices
          .commonApi(api.authenticate, body, ApiType.post)
          .then((value) async {
        if (value.data['responseStatus'] == 1) {
          hideLoading(context);
          log("login data ${value.data}");

          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setInt(session.id, value.data['user']['id']);
          await pref.setString(session.accessToken, value.data['token']);
          log("token session.id ${pref.getInt(session.id)}");
          log("accessToken ${pref.getString(session.accessToken)}");

          pref.setString(session.tokenExpiration, value.data['expiration']);

          final homePvr =
              Provider.of<HomeScreenProvider>(context, listen: false);
          final searchPvr = Provider.of<SearchProvider>(context, listen: false);
          final attractionPvr =
              Provider.of<AttractionProvider>(context, listen: false);
          final offerPvr = Provider.of<OfferProvider>(context, listen: false);
          final dash = Provider.of<DashboardProvider>(context, listen: false);
          final catListPvr =
              Provider.of<CategoriesListProvider>(context, listen: false);
          homePvr.homeFeed(context);
          searchPvr.getBusinessSearchAPI(context, isFilter: false);
          attractionPvr.getAttractionSearchAPI(context);
          offerPvr.getViewAllOfferAPI();

          catListPvr.getCategoriesData(context);
          offerPvr.getCategoriesData(context);

          dash.selectIndex = 0;

          route.pushNamed(context, routeName.dashboard);
        } else {
          hideLoading(context);
          showMessage(context, value.data['responseMessage']);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("EEEE : login $e");
    }
  }*/

  // final Dio dio = Dio();
  // Map<String, dynamic>? userData;

  // Future<UserCredential?> signInWithFacebook() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;
  //       final OAuthCredential credential =
  //           FacebookAuthProvider.credential(accessToken.tokenString);
  //
  //       return await auth.signInWithCredential(credential);
  //     } else {
  //       print("Facebook Login Failed: ${result.status}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Error in Facebook Sign-In: $e");
  //     return null;
  //   }
  // }

  Future<UserCredential> signInWithFacebook(context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);
        log("userCredential ${credential.appleFullPersonName?.familyName}");
        log("userCredential ${credential.appleFullPersonName?.givenName}");
        log("userCredential ${credential.appleFullPersonName?.middleName}");
        log("userCredential ${credential.appleFullPersonName?.namePrefix}");
        log("userCredential ${credential.appleFullPersonName?.nameSuffix}");
        log("userCredential ${credential.appleFullPersonName?.nickname}");
        route.pushNamed(context, routeName.dashboard);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication exceptions
      log('Firebase Auth Exception: ${e.message}');
      rethrow; // rethrow the exception
    } catch (e) {
      // Handle other exceptions
      log('Other Exception: $e');
      rethrow; // rethrow the exception
    }
  }

  
// Future<void> loginWithFacebook() async {
//   final LoginResult result = await FacebookAuth.instance
//       .login(permissions: ['email', 'public_profile']);
//
//   if (result.status == LoginStatus.success) {
//     final AccessToken accessToken = result.accessToken!;
//
//     try {
//       Response response = await dio.post(
//         "https://go-1-api.azurewebsites.net/api/authentication/facebook",
//         data: jsonEncode({"access_token": accessToken.tokenString}),
//         options: Options(headers: {"Content-Type": "application/json"}),
//       );
//
//       if (response.statusCode == 200) {
//         notifyListeners();
//         userData = response.data;
//         notifyListeners();
//       } else {
//         log("Backend authentication failed: ${response.data}");
//       }
//     } catch (e) {
//       log("API Error: $e");
//     }
//   } else {
//     print("Facebook Login Failed: ${result.status}");
//   }
// }
}
