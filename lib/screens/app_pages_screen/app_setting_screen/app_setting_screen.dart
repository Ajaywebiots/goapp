import '../../../config.dart';
import '../../../providers/app_pages_provider/app_setting_provider.dart';
import 'layouts/app_setting_layout.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingProvider>(builder: (context, settingCtrl, child) {
      return LoadingComponent(
          child: StatefulWrapper(
              onInit: () {},
              child: Scaffold(
                  appBar: AppBar(
                      elevation: 0,
                      centerTitle: true,
                      leadingWidth: 80,
                      leading: CommonArrow(
                              arrow: rtl(context)
                                  ? eSvgAssets.arrowRight
                                  : eSvgAssets.arrowLeft1,
                              onTap: () => route.pop(context))
                          .paddingAll(Insets.i8),
                      title: Text(language(context, "App Settings"),
                          style: appCss.dmDenseBold18
                              .textColor(appColor(context).darkText))),
                  body: const AppSettingLayout())));
    });
  }
}
