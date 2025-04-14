import 'package:flutter/cupertino.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/rate_app_provider.dart';
import '../../../providers/app_pages_provider/service_review_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/dotted_line.dart';
import '../../../widgets/edit_review_layout.dart';
import '../add_new_location/drop_down_layout.dart';
import '../services_details_screen/layouts/service_review_layout.dart';
import 'layouts/progress_bar_layout.dart';
import 'layouts/rating_layout.dart';

class ServiceReviewScreen extends StatelessWidget {
  const ServiceReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceReviewProvider>(
        builder: (context1, serviceCtrl, child) {
      final value = Provider.of<RateAppProvider>(context, listen: false);

      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((s) => serviceCtrl.onReady(context)),
        child: DirectionalityRtl(
          child: Scaffold(
              appBar: AppBarCommon(title: appFonts.review),
              body: SingleChildScrollView(
                  child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingLayout(),
                      const HSpace(Sizes.s15),
                      Row(children: [
                        Text(language(context, appFonts.averageRate),
                            style: appCss.dmDenseMedium12
                                .textColor(appColor(context).primary)),
                        const HSpace(Sizes.s4),
                        Text("${4.5}/5",
                            style: appCss.dmDenseSemiBold12
                                .textColor(appColor(context).primary))
                      ])
                    ]).paddingAll(Insets.i12).decorated(
                    color: appColor(context).primary.withValues(alpha: 0.1),
                    border: Border.all(color: appColor(context).primary),
                    borderRadius: BorderRadius.circular(AppRadius.r20)),
                const VSpace(Sizes.s15),
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: appArray.reviewRating.map((e) {
                          int index = appArray.reviewRating.indexOf(e);
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: ProgressBarLayout(
                                  data:
                                      int.tryParse(e["percentage"] ?? "0") ?? 0,
                                  index: index,
                                  list: appArray.reviewRating));
                        }).toList())
                    .paddingSymmetric(
                        vertical: Insets.i15, horizontal: Insets.i20)
                    .boxBorderExtension(context, isShadow: true),
                const VSpace(Sizes.s25),
                ButtonCommon(
                    title: 'Add Review',
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SafeArea(
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.4,
                                  child: Stack(children: [
                                    SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    language(context,
                                                        appFonts.addReview),
                                                    style: appCss
                                                        .dmDenseMedium18
                                                        .textColor(
                                                            appColor(context)
                                                                .darkText)),
                                                const Icon(
                                                        CupertinoIcons.multiply)
                                                    .inkWell(
                                                        onTap: () =>
                                                            route.pop(context))
                                              ]).paddingSymmetric(
                                              vertical: 20,
                                              horizontal: Insets.i20),
                                          Column(children: [
                                            Text(
                                                    language(
                                                        context,
                                                        appFonts
                                                            .whatDoYouThink),
                                                    style: appCss
                                                        .dmDenseMedium14
                                                        .textColor(
                                                            appColor(context)
                                                                .lightText))
                                                .paddingAll(Insets.i20),
                                            const DottedLines(),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      language(context,
                                                          appFonts.rateUs),
                                                      style: appCss
                                                          .dmDenseMedium14
                                                          .textColor(
                                                              appColor(context)
                                                                  .darkText)),
                                                  const VSpace(Sizes.s12),
                                                  Consumer<RateAppProvider>(
                                                      builder: (context, value,
                                                          child) {
                                                    return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: appArray
                                                                    .editReviewList
                                                                    .asMap()
                                                                    .entries
                                                                    .map((e) =>
                                                                        EditReviewLayout(
                                                                            data: e
                                                                                .value,
                                                                            index: e
                                                                                .key,
                                                                            selectIndex: value
                                                                                .selectedIndex,
                                                                            onTap:
                                                                                () {
                                                                              value.onTapEmoji(e.key);
                                                                            }))
                                                                    .toList())
                                                            .width(MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.3));
                                                  }),
                                                  const VSpace(Sizes.s25),
                                                  Text(
                                                      language(
                                                          context,
                                                          appFonts
                                                              .writeYourReview),
                                                      style: appCss
                                                          .dmDenseMedium14
                                                          .textColor(
                                                              appColor(context)
                                                                  .darkText)),
                                                  const VSpace(Sizes.s12),
                                                  TextFieldCommon(
                                                    hintText:
                                                        appFonts.writeHere,
                                                    minLines: 8,
                                                    maxLines: 8,
                                                    controller:
                                                        value.rateController,
                                                    focusNode: value.rateFocus,
                                                    isNumber: true,
                                                    validator: (val) =>
                                                        validation
                                                            .commonValidation(
                                                                context, val),
                                                  )
                                                ]).paddingAll(Insets.i20)
                                          ])
                                              .boxShapeExtension(
                                                  color: appColor(context)
                                                      .fieldCardBg,
                                                  radius: AppRadius.r12)
                                              .paddingDirectional(
                                                  horizontal: 20),
                                          VSpace(Insets.i20),
                                          BottomSheetButtonCommon(
                                                  textOne: appFonts.cancel,
                                                  textTwo: appFonts.submit,
                                                  applyTap: () =>
                                                      value.onSubmit(context),
                                                  clearTap: () =>
                                                      value.onSubmit(context))
                                              .backgroundColor(
                                                  appColor(context).whiteColor)
                                              .alignment(Alignment.bottomCenter)
                                        ])),
                                  ])).bottomSheetExtension(context),
                            );
                          });
                    }).paddingOnly(bottom: 25),
                Row(children: [
                  Expanded(
                      child: Text(language(context, appFonts.review),
                          style: appCss.dmDenseMedium16
                              .textColor(appColor(context).darkText))),
                  Expanded(
                      child: DropDownLayout(
                          isIcon: false,
                          val: serviceCtrl.exValue,
                          categoryList: appArray.reviewLowHighList,
                          onChanged: (val) => serviceCtrl.onReview(val)))
                ]),
                const VSpace(Sizes.s15),
                ...serviceCtrl.reviewList
                    .asMap()
                    .entries
                    .map((e) => ServiceReviewLayout(
                        data: e.value,
                        index: e.key,
                        list: serviceCtrl.reviewList))
                    .toList()
              ]).paddingSymmetric(horizontal: Insets.i20))),
        ),
      );
    });
  }
}
