import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/screens/app_pages_screen/contact_us_screen/layouts/text_field_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> contactKey = GlobalKey<FormState>();
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
                        Stack(
                            children: [
                              const FieldsBackground(),
                              TextFieldBody(contactKey: contactKey),
                            ]),
                        const VSpace(Sizes.s40),
                        ButtonCommon(
                            title: "Submit",
                            onTap: () {
                              final isValid =
                                  contactKey.currentState?.validate() ??
                                      false;
                              if (isValid) {
                                value.submitSupportAPI(context);
                              }
                            })
                      ]).paddingAll(Insets.i20))))));

    });
  }
}
