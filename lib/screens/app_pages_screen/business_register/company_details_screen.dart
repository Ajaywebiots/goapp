import 'package:goapp/screens/app_pages_screen/business_register/business_sign_up_five.dart';
import 'package:goapp/screens/app_pages_screen/business_register/business_sign_up_four.dart';
import 'package:goapp/screens/app_pages_screen/business_register/business_sign_up_one.dart';
import 'package:goapp/screens/app_pages_screen/business_register/business_sign_up_three.dart';
import 'package:goapp/screens/app_pages_screen/business_register/business_sign_up_two.dart';
import 'package:goapp/screens/app_pages_screen/business_register/layouts/dot_indicator_layout.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../../../widgets/dotted_line.dart';

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key});

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, SignUpCompanyProvider>(
        builder: (context, languages, value, child) {
      return Scaffold(
          appBar: AppBar(
            leadingWidth: 60,
            title: Text(
                language(
                    context,
                    value.pageIndex == 0
                        ? "Company Details"
                        : value.pageIndex == 1
                            ? "Business Location"
                            : value.pageIndex == 2
                                ? "Business Contact"
                                : value.pageIndex == 3
                                    ? "Business Working Hours"
                                    : "Business Gallery"),
                style: appCss.dmDenseMedium18
                    .textColor(appColor(context).darkText)),
            centerTitle: true,
            leading: CommonArrow(
                    arrow: languages.isUserRTl
                        ? eSvgAssets.arrowRight
                        : eSvgAssets.arrowLeft,
                    onTap: () => value.goBack(context))
                .padding(vertical: Insets.i8, left: 20),
            actions: [
              if (value.pageIndex == 0)
                SvgPicture.asset(eSvgAssets.translate)
                    .inkWell(onTap: () => value.translateTap(context))
                    .padding(horizontal: Sizes.s20)
            ],
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            VSpace(Sizes.s25),
            BusinessDotIndicator(selectedIndex: value.pageIndex),
            const VSpace(Sizes.s15),
            Stack(children: [
              const FieldsBackground(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        language(
                                context,
                                value.pageIndex == 0
                                    ? "Business Details"
                                    : value.pageIndex == 1
                                        ? "Business Location"
                                        : value.pageIndex == 2
                                            ? "Business Contact"
                                            : value.pageIndex == 3
                                                ? "Working hours"
                                                : "Business Gallery")
                            .toUpperCase(),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).darkText)),
                    const DottedLines().paddingSymmetric(vertical: Insets.i20),
                    value.pageIndex == 0
                        ? const BusinessSignUpOne()
                        : value.pageIndex == 1
                            ? BusinessSignUpTwo(sync: this)
                            : value.pageIndex == 2
                                ? const BusinessSignUpThree()
                                : value.pageIndex == 3
                                    ? BusinessSignUpFour()
                                    : BusinessSignUpFive()
                  ]).paddingSymmetric(vertical: Insets.i25)
            ]).paddingSymmetric(horizontal: Insets.i20),
            ButtonCommon(
                    title: value.pageIndex == 0 ||
                            value.pageIndex == 1 ||
                            value.pageIndex == 2 ||
                            value.pageIndex == 3
                        ? "Next"
                        : "Finish",
                    onTap: () => value.onNext(context))
                .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i30)
          ])));
    });
  }
}
