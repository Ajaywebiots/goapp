import '../../../../config.dart';
import '../../../../providers/app_pages_provider/app_setting_provider.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class AppSettingLayout extends StatelessWidget {
  const AppSettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
      child:
          Consumer<AppSettingProvider>(builder: (context1, settingCtrl, child) {
        return Consumer<ThemeService>(builder: (themeContext, theme, child) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...appArray.appSetting().asMap().entries.map((e) {
              return Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CommonArrow(arrow: e.value['icon'].toString()),
                        const HSpace(Sizes.s12),
                        Text(language(context, e.value['title']),
                            style: appCss.dmDenseRegular14
                                .textColor(appColor(context).darkText))
                      ]),
                      SvgPicture.asset(
                          rtl(context)
                              ? eSvgAssets.arrowLeft
                              : eSvgAssets.arrowRight,
                          colorFilter: ColorFilter.mode(
                              appColor(context).lightText, BlendMode.srcIn))
                    ]).paddingSymmetric(vertical: Insets.i12),
                e.key == 1
                    ? SizedBox.shrink()
                    : Divider(color: appColor(context).fieldCardBg, height: 0)
              ])
                  .paddingSymmetric(horizontal: Insets.i15)
                  .width(MediaQuery.of(context).size.width)
                  .inkWell(onTap: () => settingCtrl.onTapData(context, e.key));
            })
          ]).height(130).decorated(
              color: appColor(context).whiteColor,
              border: Border.all(color: appColor(context).fieldCardBg),
              borderRadius: BorderRadius.circular(AppRadius.r12),
              boxShadow: [
                BoxShadow(
                    color: appColor(context).fieldCardBg,
                    spreadRadius: 2,
                    blurRadius: 4)
              ]);
        }).marginOnly(left: Insets.i15, right: Insets.i15, top: Insets.i25);
      }),
    );
  }
}
