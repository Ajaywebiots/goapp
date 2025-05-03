import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:goapp/providers/app_pages_provider/my_review_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/profile_detail_provider.dart';
import '../../../providers/bottom_providers/booking_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
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
              Provider.of<ProfileDetailProvider>(context, listen: false)
                  .getProfileDetailDataAPI(context);
              Provider.of<MyReviewProvider>(context, listen: false)
                  .getMyReviewListData();
            },
            child: DirectionalityRtl(
                child: Scaffold(
                    extendBody: true,
                    bottomNavigationBar: Consumer<ThemeService>(
                        builder: (themeContext, theme, child) {
                      return AnimatedBottomNavigationBar.builder(
                          elevation: 18,
                          activeIndex: value.selectIndex,
                          height: 76,
                          gapLocation: GapLocation.none,
                          shadow: BoxShadow(
                              color:
                                  appColor(context).darkText.withOpacity(0.12),
                              blurRadius: 20,
                              spreadRadius: 25),
                          // notchSmoothness: NotchSmoothness.softEdge,
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
                                                      value.selectIndex ==
                                                          index)
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
                                      language(
                                          context,
                                          appArray.dashboardList[index]
                                              ["title"]!),
                                      overflow: TextOverflow.ellipsis,
                                      style: value.selectIndex == index
                                          ? appCss.dmDenseMedium14.textColor(
                                              appColor(context).primary)
                                          : appCss.dmDenseRegular14.textColor(
                                              appColor(context).darkText))
                                ]);
                          });
                    }),
                    body: NoInternetLayout(
                        child:
                            Center(child: value.pages[value.selectIndex])))));
      });
    });
  }
}
