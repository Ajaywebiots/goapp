import 'dart:async';

import '../../../config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    final SplashProvider splash =
        Provider.of<SplashProvider>(context, listen: false);
    splash.onReady(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(builder: (context, splash, child) {
      return StatefulWrapper(
          onInit: () => Timer(
              const Duration(milliseconds: 150), () => splash.onChangeSize()),
          child: Scaffold(
              body: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  color: splash.backgroundColor,
                  child: Center(
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          // Logo animation duration
                          curve: Curves.easeInOut,
                          height: splash.logoSize,
                          width: splash.logoSize,
                          child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              // Smooth logo switch
                              child: Image.asset(splash.logo,
                                  key: ValueKey(splash.logo))))))));
    });
  }
}
