import 'dart:developer';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/widgets/no_internet_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  bool isGuest = false;


  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    var isIntro = prefs.getBool("isIntro");
    log("isIntro::$isIntro");

    setState(() {
      // If accessToken is null or empty, user is a guest
      isGuest = accessToken == null || accessToken.isEmpty;
      log("Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    loadGuestStatus();
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
              });
              SharedPreferences pref = await SharedPreferences.getInstance();
              if(pref.getBool("isGuest")==false){
              Provider.of<ProfileDetailProvider>(context, listen: false)
                  .getProfileDetailDataAPI(context);
              Provider.of<MyReviewProvider>(context, listen: false)
                  .getMyReviewListData();}
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
                                  SvgPicture.asset(
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
