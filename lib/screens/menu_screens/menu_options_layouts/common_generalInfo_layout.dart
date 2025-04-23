import 'package:flutter_html/flutter_html.dart';
import 'package:goapp/providers/bottom_providers/profile_provider.dart';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/dotted_line.dart';

class CommonGeneralInfoLayout extends StatelessWidget {
  const CommonGeneralInfoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePvr = Provider.of<ProfileProvider>(context, listen: false);
    return DirectionalityRtl(
        child: Scaffold(
            appBar: AppBarCommon(
                title: language(context, profilePvr.appPagesData?.page?.title)),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(8)),
                            child: profilePvr.appPagesData?.page?.heroImage ==
                                    null
                                ? Image.asset(eImageAssets.noImageFound2,
                                    height: 154,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill)
                                : Image.network(
                                    profilePvr.appPagesData?.page?.heroImage,
                                    height: 154,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill)),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: profilePvr
                                    .appPagesData?.page?.sections.length ??
                                0,
                            itemBuilder: (context, index) {
                              final section = profilePvr
                                  .appPagesData!.page!.sections[index];
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  language(
                                                      context, section.title),
                                                  overflow: TextOverflow.clip,
                                                  style: appCss.dmDenseMedium16
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText)))
                                        ]),
                                    const DottedLines().paddingOnly(
                                        top: Insets.i15, bottom: Insets.i10),
                                    Html(data: section.text, style: {
                                      "body": Style(
                                          fontFamily:
                                              GoogleFonts.dmSans().fontFamily,
                                          fontSize: FontSize(14),
                                          color: appColor(context).darkText,
                                          fontWeight: FontWeight.w500)
                                    }),
                                    VSpace(Insets.i12)
                                  ]).paddingAll(Insets.i15);
                            })
                      ]))
                  .decorated(
                      color: appColor(context).whiteBg,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: appColor(context).darkText.withOpacity(0.06))
                      ],
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                      border: Border.all(color: appColor(context).stroke))
                  .padding(vertical: Insets.i15, horizontal: Insets.i20)
            ])))));
  }
}
