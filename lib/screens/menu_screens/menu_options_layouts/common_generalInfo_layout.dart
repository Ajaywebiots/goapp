import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/dotted_line.dart';

class CommonGeneralInfoLayout extends StatelessWidget {
  const CommonGeneralInfoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    return DirectionalityRtl(
        child: Scaffold(
            appBar: AppBarCommon(title: language(context, args['appBarTitle'])),
            body: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(8)),
                            child: Image.asset(args['image'],
                                height: 154,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(language(context, args['title1']),
                                        overflow: TextOverflow.clip,
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context).darkText))
                                  ]),
                              const DottedLines().paddingOnly(
                                  top: Insets.i15, bottom: Insets.i10),
                              Text(args['aboutDescription'],
                                  style: appCss.dmDenseRegular14
                                      .textColor(appColor(context).darkText)),
                              VSpace(Insets.i12),
                              Text(args['aboutDescription1'],
                                  style: appCss.dmDenseRegular14)
                            ]).paddingAll(Insets.i15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(language(context, args['title2']),
                                        overflow: TextOverflow.clip,
                                        style: appCss.dmDenseMedium16.textColor(
                                            appColor(context).darkText))
                                  ]),
                              const DottedLines().paddingOnly(
                                  top: Insets.i15, bottom: Insets.i10),
                              Text(args['aboutDescription2'],
                                  style: appCss.dmDenseRegular14
                                      .textColor(appColor(context).darkText)),
                              VSpace(Insets.i12),
                              Text(args['aboutDescription3'],
                                  style: appCss.dmDenseRegular14
                                      .textColor(appColor(context).darkText))
                            ]).paddingDirectional(
                            horizontal: Insets.i15,
                            top: Insets.i15,
                            bottom: Insets.i50)
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
            ]))));
  }
}
