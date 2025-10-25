import '../../config.dart';
import '../../widgets/DirectionalityRtl.dart';
import 'layouts/profile_options_layout.dart';
import 'layouts/profile_setting_top_layout.dart';

class MenuScreen extends StatelessWidget {
  final bool isHomeScreen;

  const MenuScreen({super.key, this.isHomeScreen = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profilePvr, child) {
      return DirectionalityRtl(
          child: SafeArea(
              child: Scaffold(
                  appBar: AppBarCommon(
                      title: language(context,appFonts.settings),
                      onTap: () {
                        profilePvr.isProfileBack == false;
                        if (isHomeScreen) {
                          final dash = Provider.of<DashboardProvider>(context,
                              listen: false);
                          final homePvr = Provider.of<HomeScreenProvider>(
                              context,
                              listen: false);
                          dash.selectIndex = 0;
                          profilePvr.isProfileBack == false;
                          dash.notifyListeners();
                          homePvr.notifyListeners();
                        }
                      }),
                  body: SingleChildScrollView(
                      child: Column(children: [
                    ProfileSettingTopLayout(),
                    VSpace(Sizes.s15),
                    ProfileOptionsLayout()
                  ]).padding(
                          horizontal: Insets.i20,
                          top: Insets.i10,
                          bottom: Insets.i50)))));
    });
  }
}
