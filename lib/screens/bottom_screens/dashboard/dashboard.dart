import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

import '../../../config.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../../../providers/bottom_providers/booking_provider.dart';
import '../../../providers/bottom_providers/cart_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/no_internet_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context1, value, child) {
      return Consumer<CommonPermissionProvider>(
          builder: (context2, permission, child) {
        return StatefulWrapper(
            onInit: () async {
              value.pref = await SharedPreferences.getInstance();
              value.notifyListeners();
              Future.delayed(DurationClass.ms150).then((_) {
                permission.checkIfLocationEnabled().then((value) async {
                  log("PERMISSION : $value");
                  if (value == true) {
                  } else {
                    await Permission.location.request();
                  }
                });
                final bookingCtrl =
                    Provider.of<BookingProvider>(context, listen: false);
                bookingCtrl.onReady(context, value);
              });
            },
            child: Scaffold(
                /* floatingActionButton: MediaQuery.of(context)
                                .viewInsets
                                .bottom !=
                            0 &&
                        value.isTap == true
                    ? null
                    : FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.r50)),
                        onPressed: () => value.cartTap(context),
                        child: Consumer<CartProvider>(
                            builder: (context4, cart, child) {
                          return Stack(alignment: Alignment.center, children: [
                            SvgPicture.asset(cart.cartList.isEmpty
                                ? eSvgAssets.cart
                                : eSvgAssets.cartFill),
                            if (cart.cartList.isNotEmpty)
                              Positioned(
                                  top: -4.4,
                                  right: 0,
                                  child: Container(
                                          child: Text(
                                                  cart.cartList.length
                                                      .toString(),
                                                  style: appCss.dmDenseMedium8
                                                      .textColor(
                                                          appColor(context)
                                                              .whiteColor))
                                              .paddingAll(Insets.i5))
                                      .decorated(
                                          color: appColor(context).red,
                                          shape: BoxShape.circle)
                                      .paddingOnly(
                                          top: Insets.i2, left: Insets.i2))
                          ]).height(Sizes.s38).width(Sizes.s30);
                        })),*/
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,
                extendBody: true,
                bottomNavigationBar: Consumer<ThemeService>(
                    builder: (themeContext, theme, child) {
                  return AnimatedBottomNavigationBar.builder(
                      elevation: 18,
                      activeIndex: value.selectIndex,
                      height: 76,
                      gapLocation: GapLocation.none,
                      shadow: BoxShadow(
                          color: appColor(context).darkText.withOpacity(0.12),
                          blurRadius: 20,
                          spreadRadius: 25),
                      notchSmoothness: NotchSmoothness.softEdge,
                      leftCornerRadius: AppRadius.r18,
                      rightCornerRadius: AppRadius.r18,
                      backgroundColor: appColor(context).whiteBg,
                      onTap: (index) => value.onTap(index, context),
                      itemCount: appArray.dashboardList.length,
                      tabBuilder: (int index, bool isActive) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appColor(context).isDark
                                  ? SvgPicture.asset(
                                      value.selectIndex == index
                                          ? appArray.dashboardList[index]
                                              ["icon2"]!
                                          : appArray.dashboardList[index]
                                              ["icon"]!,
                                      height: Sizes.s24,
                                      width: Sizes.s24,
                                      colorFilter: ColorFilter.mode(
                                          (appColor(context).isDark &&
                                                  value.selectIndex == index)
                                              ? appColor(context).primary
                                              : appColor(context).darkText,
                                          BlendMode.srcIn),
                                      fit: BoxFit.scaleDown)
                                  : SvgPicture.asset(
                                      value.selectIndex == index
                                          ? appArray.dashboardList[index]
                                              ["icon2"]!
                                          : appArray.dashboardList[index]
                                              ["icon"]!,
                                      height: Sizes.s24,
                                      width: Sizes.s24,
                                      fit: BoxFit.scaleDown),
                              const VSpace(Sizes.s5),
                              Text(
                                  language(context,
                                      appArray.dashboardList[index]["title"]!),
                                  overflow: TextOverflow.ellipsis,
                                  style: value.selectIndex == index
                                      ? appCss.dmDenseMedium14
                                          .textColor(appColor(context).primary)
                                      : appCss.dmDenseRegular14.textColor(
                                          appColor(context).darkText))
                            ]);
                      });
                }),
                body: NoInternetLayout(
                    child: Center(child: value.pages[value.selectIndex]))));
      });
    });
  }
}
