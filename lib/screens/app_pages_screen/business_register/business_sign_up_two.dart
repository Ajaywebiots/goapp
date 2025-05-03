import '../../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/dotted_line.dart';

class BusinessSignUpTwo extends StatelessWidget {
  final TickerProvider? sync;

  const BusinessSignUpTwo({super.key, this.sync});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpCompanyProvider, CommonApiProvider>(
        builder: (context1, value, api, child) {
      return Form(
          key: value.signupFormKey2,
          child: Column(children: [
            ContainerWithTextLayout(title: "Street")
                .paddingOnly(bottom: Insets.i8),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.s20, vertical: Sizes.s20),
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                          cornerRadius: 8, cornerSmoothing: 1)),
                  color: appColor(context).whiteBg,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SvgPicture.asset(eSvgAssets.address),
                        HSpace(Sizes.s15),
                        value.areaData == null
                            ? Text(language(context, "company Location"),
                                style: appCss.dmDenseMedium14
                                    .textColor(appColor(context).lightText))
                            : Expanded(
                                child: Text(value.areaData,
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).darkText)))
                      ]),
                      SvgPicture.asset(eSvgAssets.gps)
                      // .inkWell(onTap: () => value.getLocation(context))
                    ])),
            const VSpace(Sizes.s20),
            Row(children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                      children: [
                        const SmallContainer(),
                        const HSpace(Sizes.s20),
                        textCommon.dmSensMediumDark14(context, text: "City"),
                      ],
                    ),
                    const VSpace(Sizes.s5),
                    TextFieldCommon(
                            // validator: (city) =>
                            //     validation.cityValidation(context, city),
                            controller: value.city,
                            focusNode: value.cityFocus,
                            hintText: "City",
                            prefixIcon: eSvgAssets.cityLoc)
                        .padding(left: Sizes.s20)
                  ])),
              const HSpace(Sizes.s18),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    textCommon.dmSensMediumDark14(context, text: "ZipCode"),
                    const VSpace(Sizes.s10),
                    TextFieldCommon(
                            keyboardType: TextInputType.number,
                            // validator: (zip) =>
                            //     validation.zipCodeValidation(context, zip),
                            controller: value.zipCode,
                            focusNode: value.zipcodeFocus,
                            hintText: "Enter here",
                            prefixIcon: eSvgAssets.zipcode)
                        .padding(right: Sizes.s20)
                  ]))
            ]),
            const VSpace(Sizes.s15),
            ContainerWithTextLayout(title: "Country")
                .paddingOnly(bottom: Insets.i8),
            TextFieldCommon(
                    focusNode: value.streetFocus,
                    // validator: (val) => validation.dynamicTextValidation(
                    //     context, val, pleaseEnterDesc),
                    controller: value.street,
                    hintText: "Enter Country",
                    prefixIcon: eSvgAssets.global)
                .paddingSymmetric(horizontal: Insets.i20),
            const DottedLines().paddingSymmetric(vertical: Insets.i22),
            Row(children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                      children: [
                        const SmallContainer(),
                        const HSpace(Sizes.s20),
                        textCommon.dmSensMediumDark14(context,
                            text: "Latitude"),
                      ],
                    ),
                    const VSpace(Sizes.s5),
                    TextFieldCommon(
                            // validator: (city) =>
                            //     validation.cityValidation(context, city),
                            controller: value.latitude,
                            focusNode: value.latitudeFocus,
                            hintText: "Enter here",
                            prefixIcon: eSvgAssets.cityLoc)
                        .padding(left: Sizes.s20),
                  ])),
              const HSpace(Sizes.s18),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    textCommon.dmSensMediumDark14(context, text: "Longitude"),
                    const VSpace(Sizes.s8),
                    TextFieldCommon(
                            // validator: (zip) =>
                            //     validation.cityValidation(context, zip),
                            controller: value.longitude,
                            focusNode: value.longitudeFocus,
                            hintText: "Enter here",
                            prefixIcon: eSvgAssets.cityLoc)
                        .padding(right: Sizes.s20)
                  ]))
            ]),
          ]));
    });
  }
}
