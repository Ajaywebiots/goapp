import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import 'layouts/radio_layout.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context1, languageCtrl, child) {
      return LoadingComponent(
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBar(
                      elevation: 0,
                      centerTitle: true,
                      leadingWidth: 80,
                      leading: CommonArrow(
                          arrow: languageCtrl.getLocal() == "ar" || languageCtrl.getLocal() == "el"
                              ? eSvgAssets.arrowRight
                              : eSvgAssets.arrowLeft,
                          onTap: () =>
                              route.pop(context)).paddingAll(Insets.i8),
                      title: Text(language(context, language(context, appFonts.changeLanguage)),
                          style: appCss.dmDenseBold18
                              .textColor(appColor(context).darkText))),
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const RadioLayout()]))));
    });
  }
}
