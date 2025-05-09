import 'package:goapp/config.dart';
import 'package:goapp/providers/app_pages_provider/contact_us_provider.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/screens/app_pages_screen/contact_us_screen/layouts/text_field_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactUsProvider>(builder: (context1, value, child) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar: AppBar(
                      leadingWidth: Insets.i80,
                      title: Text(language(context, appFonts.contactUs),
                          style: appCss.dmDenseBold18
                              .textColor(appColor(context).darkText)),
                      centerTitle: true,
                      leading: CommonArrow(
                              arrow: rtl(context)
                                  ? eSvgAssets.arrowRight
                                  : eSvgAssets.arrowLeft,
                              onTap: () => route.pop(context))
                          .padding(vertical: Insets.i8)),
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    const Stack(
                        children: [FieldsBackground(), TextFieldBody()]),
                    const VSpace(Sizes.s40),
                    ButtonCommon(
                        title: "Submit",
                        onTap: () {
                          final isValid =
                              value.contactKey.currentState?.validate() ??
                                  false;
                          if (isValid) {
                            value.submitSupportAPI(context);
                          }
                        })
                  ]).paddingAll(Insets.i20))))));
    });
  }
}
