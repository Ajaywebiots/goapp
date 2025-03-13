import '../../../../config.dart';

class ProviderTopLayout extends StatelessWidget {
  const ProviderTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDetailsProvider>(
        builder: (context, providerCtrl, child) {
      return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

              image: DecorationImage(

                  image: AssetImage(appColor(context).isDarkMode ?eImageAssets.providerBgDark : eImageAssets.providerBg),
                  fit: BoxFit.fill)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfilePicCommon(
                  isProfile: false,
                  imageUrl: providerCtrl.provider!.media != null &&
                          providerCtrl.provider!.media!.isNotEmpty
                      ? providerCtrl.provider!.media![0].originalUrl
                      : null,
                ).alignment(Alignment.center),
                const VSpace(Sizes.s8),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(providerCtrl.provider!.name!,
                      style: appCss.dmDenseSemiBold14
                          .textColor(appColor(context).appTheme.darkText)),
                  const HSpace(Sizes.s6),
                  SvgPicture.asset(eSvgAssets.tick)
                ]),
                const VSpace(Sizes.s6),
                IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Column(children: [
                        RatingLayout(
                            initialRating:
                                providerCtrl.provider!.reviewRatings != null
                                    ? double.parse(providerCtrl
                                        .provider!.reviewRatings
                                        .toString())
                                    : 0.0,
                            color: const Color(0xffFFC412)),
                        Text("${providerCtrl.provider!.reviewRatings ?? 0} reviews",
                            style: appCss.dmDenseMedium13
                                .textColor(appColor(context).appTheme.darkText))
                      ]),
                      VerticalDivider(
                              width: 1,
                              color: appColor(context).appTheme.stroke,
                              indent: 3,
                              endIndent: 3)
                          .paddingSymmetric(horizontal: Insets.i10),
                      Text(
                          "${providerCtrl.provider!.experienceDuration ?? 0} ${providerCtrl.provider!.experienceInterval ?? "year"} ${language(context, appFonts.of)} ${language(context, appFonts.experience)}",
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).appTheme.darkText))
                    ])),
                const VSpace(Sizes.s20),
                const DottedLines(),
                const VSpace(Sizes.s10),
                ServicesDeliveredLayout(
                    services: providerCtrl.provider!.served ?? "0"),
                Text(language(context, appFonts.detailsOfProvider),
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).appTheme.lightText))
                    .paddingOnly(top: Insets.i15, bottom: Insets.i8),
                Text(providerCtrl.provider!.description!,
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.darkText)),
                Text(language(context, appFonts.personalInfo),
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).appTheme.lightText))
                    .paddingOnly(top: Insets.i15, bottom: Insets.i8),
                PersonalDetailLayout(
                  email: providerCtrl.provider!.email!,
                  phone:
                      "${providerCtrl.provider!.code} ${providerCtrl.provider!.phone!}",
                  knownLanguage: providerCtrl.provider!.knownLanguages,
                )
              ]).paddingAll(Insets.i20));
    });
  }
}
