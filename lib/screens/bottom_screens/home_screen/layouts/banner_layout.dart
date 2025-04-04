import 'dart:ffi';

import '../../../../config.dart';
import '../../../../models/api_model/home_feed_model.dart';
import '../../../../models/banner_model.dart';

class BannerLayout extends StatelessWidget {
  final List<TopBanner>? bannerList;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final Function(String, String)? onTap;

  const BannerLayout(
      {super.key, this.bannerList, this.onPageChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (bannerList == null || bannerList!.isEmpty) {
      return const SizedBox.shrink();
    }
    return CarouselSlider(
            options: CarouselOptions(
                height: Sizes.s240,
                viewportFraction: 1,
                enlargeCenterPage: false,
                reverse: false,
                onPageChanged: onPageChanged),
            items: bannerList!.map((i) {
              return Builder(builder: (BuildContext context) {
                return Stack(children: [
                  Container(
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/imageLayer.png"))),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 0.9,
                            image: NetworkImage(i.image.source),
                            fit: BoxFit.cover)),
                  ).inkWell(onTap: () => onTap!),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  color: appColor(context).red,
                                  child: Text(i.tagText,
                                          style: appCss.dmDenseBold10.textColor(
                                              appColor(context).whiteColor))
                                      .paddingSymmetric(
                                          vertical: Insets.i3,
                                          horizontal: Insets.i6)),
                              VSpace(Insets.i15),
                              Text(i.title,
                                      style: appCss.dmDenseBold18.textColor(
                                          appColor(context).whiteColor))
                                  .paddingSymmetric(
                                      vertical: Insets.i3,
                                      horizontal: Insets.i6),
                              VSpace(Insets.i5),
                              Text(i.subTitle,
                                      style: appCss.dmDenseRegular12.textColor(
                                          appColor(context).whiteColor))
                                  .paddingSymmetric(
                                      vertical: Insets.i3,
                                      horizontal: Insets.i6)
                            ]),
                        Container(
                            decoration: BoxDecoration(
                                color: appColor(context).primary,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r20))),
                            child: Text(i.buttonText,
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).whiteColor))
                                .paddingSymmetric(
                                    vertical: Insets.i8,
                                    horizontal: Insets.i14))
                      ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i20)
                ]);
              });
            }).toList())
        .paddingOnly(top: Insets.i15);
  }
}
