import '../../config.dart';
import '../../providers/bottom_providers/profile_provider.dart';
import '../../widgets/DirectionalityRtl.dart';
import 'layouts/profile_options_layout.dart';
import 'layouts/profile_setting_top_layout.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profilePvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              const Duration(milliseconds: 100), () => profilePvr.onReady()),
          child: DirectionalityRtl(
              child: SafeArea(
                  child: Scaffold(
                      appBar: AppBar(
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
