import 'dart:async';
import 'dart:developer';

import '../../config.dart';

class SplashProvider extends ChangeNotifier {
  double size = 10;
  double roundSize = 10;
  double roundSizeWidth = 10;
  AnimationController? controller;
  Animation<double>? animation;

  AnimationController? controller2;
  Animation<double>? animation2;

  AnimationController? controller3;
  Animation<double>? animation3;

  AnimationController? controllerSlide;
  Animation<Offset>? offsetAnimation;

  AnimationController? popUpAnimationController;

  onReady(TickerProvider sync, context) async {
    bool isAvailable = await isNetworkConnection();
    if (isAvailable) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      controller = controller =
          AnimationController(vsync: sync, duration: const Duration(seconds: 1))
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                controller!.stop();
                notifyListeners();
              }
              if (status == AnimationStatus.dismissed) {
                controller!.forward();
                notifyListeners();
              }
            });

      animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
      controller!.forward();

      controller2 = AnimationController(
          vsync: sync, duration: const Duration(seconds: 1));
      animation2 = CurvedAnimation(parent: controller2!, curve: Curves.easeIn);

      if (controller2!.status == AnimationStatus.forward ||
          controller2!.status == AnimationStatus.completed) {
        controller2!.reverse();
        notifyListeners();
      } else if (controller2!.status == AnimationStatus.dismissed) {
        Timer(const Duration(seconds: 1), () {
          controller2!.forward();
          notifyListeners();
        });
      }

      controllerSlide = AnimationController(
          vsync: sync, duration: const Duration(seconds: 1));

      offsetAnimation =
          Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
              .animate(controllerSlide!);

      controller3 =
          AnimationController(duration: const Duration(seconds: 1), vsync: sync)
            ..repeat();
      animation3 = CurvedAnimation(parent: controller3!, curve: Curves.easeIn);

      popUpAnimationController = AnimationController(
          vsync: sync, duration: const Duration(seconds: 1));

      Timer(const Duration(seconds: 1), () {
        popUpAnimationController!.forward();
        notifyListeners();
      });

      log("ANIMATION CON ${popUpAnimationController!.status}");

      Timer(const Duration(seconds: 4), () async {
        await Future.delayed(Duration(milliseconds: 150)).then(
          (value) {},
        );
        bool? isIntro = pref.getBool(session.isIntro) ?? false;

        Provider.of<SplashProvider>(context, listen: false).dispose();
        onDispose();
        await Future.delayed(Duration(milliseconds: 150)).then((value) {});
        log("isIntro::$isIntro");
        if (isIntro) {
          route.pushReplacementNamed(context, routeName.login);
          /*  if (userData != null) {

          } else {
            final login = Provider.of<LoginProvider>(context, listen: false);
            login.continueAsGuestTap(context);
          }*/
        } else {
          route.pushReplacementNamed(context, routeName.onBoarding);
        }
        // }
      });
    } else {
      onDispose();
      Provider.of<SplashProvider>(context, listen: false).dispose();
      // route.pushReplacementNamed(context, routeName.noInternet);
    }
  }

//setting list

  //all category list

  bool _isDisposed = false;

  void safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  onDispose() async {
    bool isAvailable = await isNetworkConnection();
    if (!isAvailable) {
      controller2!.dispose();
      controller3!.dispose();
      animation3!.isDismissed;
      controller!.dispose();
      controllerSlide!.dispose();
      popUpAnimationController!.dispose();
    }
  }

  onChangeSize() {
    size = size == 10 ? 115 : 115;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;

    // TODO: implement dispose
    onDispose();
    controller2!.dispose();
    controller3!.dispose();
    animation3!.isDismissed;
    controller!.dispose();
    controllerSlide!.dispose();
    popUpAnimationController!.dispose();
    super.dispose();
  }
}
