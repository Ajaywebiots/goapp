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
                return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(i.source ?? ''),
                                fit: BoxFit.cover)))
                    .inkWell(onTap: () => onTap!);
              });
            }).toList())
        .paddingOnly(top: Insets.i15);
  }
}
