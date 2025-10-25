import 'package:flutter_html/flutter_html.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';
import 'package:goapp/widgets/dotted_line.dart';

class CommonGeneralInfoLayout extends StatelessWidget {
  const CommonGeneralInfoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePvr = Provider.of<ProfileProvider>(context, listen: false);
    final page = profilePvr.appPagesData?.page;

    return DirectionalityRtl(
      child: Scaffold(
        appBar: AppBarCommon(
          title: language(context, page?.title ?? ""),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appColor(context).whiteBg,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 2,
                        color: appColor(context).darkText.withOpacity(0.06),
                      )
                    ],
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    border: Border.all(color: appColor(context).stroke),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Image
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                        child: page?.heroImage?.source == null
                            ? Image.asset(
                          eImageAssets.noImageFound2,
                          height: 154,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )
                            : Image.network(
                          page!.heroImage!.source!,
                          height: 154,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),

                      // Content Title
                      if (page?.pageContentTitle != null &&
                          page!.pageContentTitle!.isNotEmpty)
                        Text(
                          page.pageContentTitle!,
                          style: appCss.dmDenseMedium16
                              .textColor(appColor(context).darkText),
                        ).paddingAll(Insets.i15),

                      // Dotted Line
                      const DottedLines()
                          .paddingOnly(top: Insets.i10, bottom: Insets.i10),

                      // Content Text
                      if (page?.pageContentText != null &&
                          page!.pageContentText!.isNotEmpty)
                        Html(
                          data: page.pageContentText!,
                          style: {
                            "body": Style(
                              fontFamily: GoogleFonts.dmSans().fontFamily,
                              fontSize: FontSize(14),
                              color: appColor(context).darkText,
                              fontWeight: FontWeight.w500,
                            )
                          },
                        ).paddingAll(Insets.i15),
                    ],
                  ),
                ).paddingSymmetric(
                  vertical: Insets.i15,
                  horizontal: Insets.i20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
