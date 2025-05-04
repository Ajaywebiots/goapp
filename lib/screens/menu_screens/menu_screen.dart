import '../../config.dart';
import '../../providers/bottom_providers/dashboard_provider.dart';
import '../../providers/bottom_providers/home_screen_provider.dart';
import '../../providers/bottom_providers/profile_provider.dart';
import '../../widgets/DirectionalityRtl.dart';
import 'layouts/profile_options_layout.dart';
import 'layouts/profile_setting_top_layout.dart';

class MenuScreen extends StatelessWidget {
  final bool isHomeScreen;

  const MenuScreen({super.key, this.isHomeScreen = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profilePvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              const Duration(milliseconds: 100), () => profilePvr.onReady()),
          child: DirectionalityRtl(
              child: SafeArea(
                  child: Scaffold(
                      appBar: AppBarCommon(
                          title: "Settings",
                          onTap: () {
                            if (isHomeScreen) {
                              final dash = Provider.of<DashboardProvider>(
                                  context,
                                  listen: false);
                              final homePvr = Provider.of<HomeScreenProvider>(
                                  context,
                                  listen: true);
                              dash.selectIndex = 0;
                              dash.notifyListeners();
                              homePvr.notifyListeners();
                            }
                          }),
                      /*AppBar(
                          title: Text(language(context, "GoSalamina Menu"),
                              style: appCss.dmDenseBold18
                                  .textColor(appColor(context).darkText)),
                          automaticallyImplyLeading: false,
                          actions: [
                            CommonArrow(
                                    arrow: eSvgAssets.setting,
                                    svgColor: appColor(context).darkText,
                                    onTap: () =>
                                        profilePvr.onTapSettingTap(context))
                                .paddingSymmetric(horizontal: Insets.i20)
<<<<<<< Updated upstream
                          ]),
                    body: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: constraints.maxHeight),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileSettingTopLayout(),
                                VSpace(Sizes.s15),
                                ProfileOptionsLayout(),
                              ],
                            ).padding(
=======
                          ]),*/
                      body: SingleChildScrollView(
                          child: Column(children: [
                        ProfileSettingTopLayout(),
                        VSpace(Sizes.s15),
                        ProfileOptionsLayout()
                      ]).padding(
>>>>>>> Stashed changes
                              horizontal: Insets.i20,
                              top: Insets.i20,
                              bottom: Insets.i110,
                            ),
                          ),
                        );
                      },
                    ),
                  ))));
    });
  }
}
