import 'package:flutter/cupertino.dart';

import '../config.dart';
import '../models/api_model/attractions_details_model.dart' as iii;
import '../models/api_model/business_details_model.dart';
import 'DirectionalityRtl.dart';

class CommonGalleryContent extends StatelessWidget {
  final BusinessSec? galleryUrls;

  const CommonGalleryContent({super.key, this.galleryUrls});

  @override
  Widget build(BuildContext context) {
    final List<String> galleryUr = galleryUrls?.gallery
            .map((logo) => logo.source ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ??
        [];
    final double sheetHeight = MediaQuery.of(context).size.height * 0.85;

    return DirectionalityRtl(
        child: SafeArea(
            child: SizedBox(
                height: sheetHeight,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language(context, appFonts.gallery),
                            style: appCss.dmDenseMedium18
                                .textColor(appColor(context).darkText)),
                        Icon(CupertinoIcons.multiply,
                                color: appColor(context).darkText)
                            .inkWell(onTap: () => route.pop(context))
                      ]).paddingSymmetric(
                      vertical: Insets.i20, horizontal: Insets.i20),
                  Expanded(
                      child: galleryUr.isEmpty
                          ? Center(
                              child: Text("No Data",
                                  style: appCss.dmDenseRegular18
                                      .textColor(appColor(context).lightText)))
                          : ListView.builder(
                              padding: EdgeInsets.only(bottom: 100),
                              itemCount: galleryUr.length + 1,
                              itemBuilder: (context, index) {
                                if (index == galleryUr.length) {
                                  return BottomSheetButtonCommon(
                                          isRateComplete: true,
                                          textOne: appFonts.close,
                                          clearTap: () =>
                                              Navigator.pop(context))
                                      .marginSymmetric(horizontal: 80)
                                      .backgroundColor(
                                          appColor(context).whiteColor)
                                      .alignment(Alignment.bottomCenter);
                                }

                                return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(AppRadius.r9),
                                        child: Image.network(galleryUr[index],
                                            height: 225, fit: BoxFit.cover))
                                    .paddingDirectional(
                                        horizontal: Insets.i20,
                                        bottom: Insets.i24);
                              }))
                ]).bottomSheetExtension(context))));
  }
}

class CommonAttractionGalleryContent extends StatelessWidget {
  final iii.Attraction? galleryUrls;

  const CommonAttractionGalleryContent({super.key, this.galleryUrls});

  @override
  Widget build(BuildContext context) {
    final List galleryUr = galleryUrls?.gallery
            .map((logo) => logo.source ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ??
        [];
    final double sheetHeight = MediaQuery.of(context).size.height * 0.85;

    return DirectionalityRtl(
        child: SafeArea(
            child: SizedBox(
                height: sheetHeight,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language(context, appFonts.gallery),
                            style: appCss.dmDenseMedium18
                                .textColor(appColor(context).darkText)),
                        Icon(CupertinoIcons.multiply,
                                color: appColor(context).darkText)
                            .inkWell(onTap: () => route.pop(context))
                      ]).paddingSymmetric(
                      vertical: Insets.i20, horizontal: Insets.i20),
                  Expanded(
                      child: galleryUr.isEmpty
                          ? Center(
                              child: Text("No Data",
                                  style: appCss.dmDenseRegular18
                                      .textColor(appColor(context).lightText)))
                          : ListView.builder(
                              padding: EdgeInsets.only(bottom: 100),
                              itemCount: galleryUr.length + 1,
                              itemBuilder: (context, index) {
                                if (index == galleryUr.length) {
                                  return BottomSheetButtonCommon(
                                          isRateComplete: true,
                                          textOne: appFonts.close,
                                          clearTap: () =>
                                              Navigator.pop(context))
                                      .marginSymmetric(horizontal: 80)
                                      .backgroundColor(
                                          appColor(context).whiteColor)
                                      .alignment(Alignment.bottomCenter);
                                }

                                return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(AppRadius.r9),
                                        child: Image.network(galleryUr[index],
                                            height: 225, fit: BoxFit.cover))
                                    .paddingDirectional(
                                        horizontal: Insets.i20,
                                        bottom: Insets.i24);
                              }))
                ]).bottomSheetExtension(context))));
  }
}
