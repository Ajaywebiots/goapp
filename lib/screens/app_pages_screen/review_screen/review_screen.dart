import 'package:flutter/cupertino.dart';
import 'package:goapp/services/api_service.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/my_review_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/dotted_line.dart';
import '../../../widgets/edit_review_layout.dart';
import 'layouts/review_layout.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyReviewProvider>(context, listen: false).getMyReviewListData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyReviewProvider>(builder: (context1, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, "My Reviews"),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8)),
              body: SafeArea(
                  child: ListView(
                      children: value.reviewList
                          .asMap()
                          .entries
                          .map((e) => ReviewLayout(
                              index: e.key,
                              data: e.value,
                              deleteTap: () async {
                                value.reviewList.removeAt(e.key);
                                value.notifyListeners();

                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                final int? userId = pref.getInt(session.id);
                                try {
                                  final res = await apiServices.commonApi(
                                      "${api.deleteReview}$userId/review/${e.value.reviewId}",
                                      [],
                                      ApiType.delete,
                                      isToken: true);

                                  if (res.isSuccess == true) {
                                    await value.getMyReviewListData();
                                    value.notifyListeners();
                                  } else {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        routeName.login,
                                        (Route<dynamic> route) => false);
                                  }
                                } catch (e) {
                                  log("EEEE $e");
                                }
                              },
                              editTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.3,
                                          child: Stack(children: [
                                            SingleChildScrollView(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            language(context,
                                                                "Edit Review"),
                                                            style: appCss
                                                                .dmDenseMedium18
                                                                .textColor(appColor(
                                                                        context)
                                                                    .darkText)),
                                                        const Icon(
                                                                CupertinoIcons
                                                                    .multiply)
                                                            .inkWell(
                                                                onTap: () =>
                                                                    route.pop(
                                                                        context))
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
                                                                .textColor(appColor(
                                                                        context)
                                                                    .lightText))
                                                        .paddingAll(Insets.i20),
                                                    const DottedLines(),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              language(
                                                                  context,
                                                                  appFonts
                                                                      .rateUs),
                                                              style: appCss
                                                                  .dmDenseMedium14
                                                                  .textColor(appColor(
                                                                          context)
                                                                      .darkText)),
                                                          const VSpace(
                                                              Sizes.s12),
                                                          Consumer<
                                                                  MyReviewProvider>(
                                                              builder: (context,
                                                                  value,
                                                                  child) {
                                                            return SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis
                                                                        .horizontal,
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
                                                                            .map((e) => EditReviewLayout(
                                                                                data: e.value,
                                                                                index: e.key,
                                                                                selectIndex: value.selectedIndex,
                                                                                onTap: () {
                                                                                  value.onTapEmoji(e.key);
                                                                                }))
                                                                            .toList())
                                                                    .width(MediaQuery.of(context).size.width / 1.3));
                                                          }),
                                                          const VSpace(
                                                              Sizes.s25),
                                                          Text(
                                                              language(
                                                                  context,
                                                                  appFonts
                                                                      .writeYourReview),
                                                              style: appCss
                                                                  .dmDenseMedium14
                                                                  .textColor(appColor(
                                                                          context)
                                                                      .darkText)),
                                                          const VSpace(
                                                              Sizes.s12),
                                                          TextFieldCommon(
                                                              hintText: appFonts
                                                                  .writeHere,
                                                              minLines: 8,
                                                              maxLines: 8,
                                                              controller: value
                                                                  .rateController,
                                                              focusNode: value
                                                                  .rateFocus,
                                                              isNumber: true,
                                                              validator: (val) =>
                                                                  validation
                                                                      .commonValidation(
                                                                          context,
                                                                          val))
                                                        ]).paddingAll(
                                                        Insets.i20)
                                                  ])
                                                      .boxShapeExtension(
                                                          color:
                                                              appColor(context)
                                                                  .fieldCardBg,
                                                          radius: AppRadius.r12)
                                                      .paddingDirectional(
                                                          horizontal: 20),
                                                  VSpace(Insets.i20),
                                                  BottomSheetButtonCommon(
                                                          textOne: appFonts.cancel,
                                                          textTwo: appFonts.submit,
                                                          applyTap: () =>
                                                              value.onSubmit(
                                                                  context),
                                                          clearTap: () =>
                                                              value.onSubmit(
                                                                  context))
                                                      .backgroundColor(
                                                          appColor(context)
                                                              .whiteColor)
                                                      .alignment(Alignment
                                                          .bottomCenter)
                                                ]))
                                          ])).bottomSheetExtension(context);
                                    });
                              }).paddingOnly(top: e.key == 0 ? 10 : 0))
                          .toList()))));
    });
  }
}
