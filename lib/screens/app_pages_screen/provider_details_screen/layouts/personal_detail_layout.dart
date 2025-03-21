import 'package:goapp/screens/app_pages_screen/provider_details_screen/layouts/personal_info_row_layout.dart';

import '../../../../common_tap.dart';
import '../../../../config.dart';
import '../../../../models/known_language_model.dart';
import 'language_layout.dart';

class PersonalDetailLayout extends StatelessWidget {
  final String? email, phone;
  final List<KnownLanguageModel>? knownLanguage;

  const PersonalDetailLayout(
      {super.key, this.email, this.phone, this.knownLanguage});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      PersonalInfoRowLayout(
              icon: eSvgAssets.mail, title: appFonts.mail, content: email)
          .inkWell(onTap: () => commonUrlTap(context, email!)),
      PersonalInfoRowLayout(
        icon: eSvgAssets.phone1,
        title: appFonts.call,
        content: phone,
      ).paddingSymmetric(vertical: Insets.i20),
      Row(children: [
        SvgPicture.asset(eSvgAssets.country,
            colorFilter:
                ColorFilter.mode(appColor(context).lightText, BlendMode.srcIn)),
        const HSpace(Sizes.s6),
        Text(language(context, appFonts.knowLanguage),
            style:
                appCss.dmDenseMedium12.textColor(appColor(context).lightText))
      ]),
      const VSpace(Sizes.s7),
      if (knownLanguage!.isNotEmpty)
        Wrap(
            direction: Axis.horizontal,
            children: knownLanguage!
                .asMap()
                .entries
                .map((e) =>
                    LanguageLayout(title: e.value.key).paddingOnly(bottom: 10))
                .toList())
    ])
        .paddingAll(Insets.i12)
        .boxShapeExtension(color: appColor(context).whiteBg);
  }
}
